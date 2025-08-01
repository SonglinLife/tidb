// Copyright 2016 PingCAP, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package expression

import (
	"slices"
	"sync"

	"github.com/pingcap/tidb/pkg/expression/exprctx"
	"github.com/pingcap/tidb/pkg/parser/ast"
	"github.com/pingcap/tidb/pkg/parser/mysql"
	"github.com/pingcap/tidb/pkg/parser/terror"
	"github.com/pingcap/tidb/pkg/types"
	"github.com/pingcap/tidb/pkg/util/chunk"
	"github.com/pingcap/tidb/pkg/util/collate"
	"github.com/pingcap/tidb/pkg/util/disjointset"
	"github.com/pingcap/tidb/pkg/util/intest"
	"github.com/pingcap/tidb/pkg/util/logutil"
	"go.uber.org/zap"
)

// MaxPropagateColsCnt means the max number of columns that can participate propagation.
var MaxPropagateColsCnt = 100

type basePropConstSolver struct {
	colMapper map[int64]int             // colMapper maps column to its index
	eqMapper  map[int]*Constant         // if eqMapper[i] != nil, it means col_i = eqMapper[i]
	unionSet  *disjointset.SimpleIntSet // unionSet stores the relations like col_i = col_j
	columns   []*Column                 // columns stores all columns appearing in the conditions
	ctx       exprctx.ExprContext
}

func newBasePropConstSolver() basePropConstSolver {
	return basePropConstSolver{
		colMapper: make(map[int64]int, 4),
		eqMapper:  make(map[int]*Constant, 4),
		columns:   make([]*Column, 0, 4),
		unionSet:  disjointset.NewIntSet(4),
	}
}

func (s *basePropConstSolver) Clear() {
	clear(s.colMapper)
	clear(s.eqMapper)
	s.columns = s.columns[:0]
	s.unionSet.Clear()
	s.ctx = nil
}

func (s *basePropConstSolver) getColID(col *Column) int {
	return s.colMapper[col.UniqueID]
}

func (s *basePropConstSolver) insertCols(cols ...*Column) {
	for _, col := range cols {
		_, ok := s.colMapper[col.UniqueID]
		if !ok {
			s.colMapper[col.UniqueID] = len(s.colMapper)
			s.columns = append(s.columns, col)
		}
	}
}

// tryToUpdateEQList tries to update the eqMapper. When the eqMapper has store this column with a different constant, like
// a = 1 and a = 2, we set the second return value to false.
func (s *basePropConstSolver) tryToUpdateEQList(col *Column, con *Constant) (bool, bool) {
	if con.Value.IsNull() && ConstExprConsiderPlanCache(con, s.ctx.IsUseCache()) {
		return false, true
	}
	id := s.getColID(col)
	oldCon, ok := s.eqMapper[id]
	if ok {
		evalCtx := s.ctx.GetEvalCtx()
		res, err := oldCon.Value.Compare(evalCtx.TypeCtx(), &con.Value, collate.GetCollator(col.GetType(s.ctx.GetEvalCtx()).GetCollate()))
		return false, res != 0 || err != nil
	}
	s.eqMapper[id] = con
	return true, false
}

// ValidCompareConstantPredicate checks if the predicate is an expression like [column '>'|'>='|'<'|'<='|'=' constant].
// return param1: return true, if the predicate is a compare constant predicate.
// return param2: return the column side of predicate.
func ValidCompareConstantPredicate(ctx EvalContext, candidatePredicate Expression) bool {
	scalarFunction, ok := candidatePredicate.(*ScalarFunction)
	if !ok {
		return false
	}
	if scalarFunction.FuncName.L != ast.GT && scalarFunction.FuncName.L != ast.GE &&
		scalarFunction.FuncName.L != ast.LT && scalarFunction.FuncName.L != ast.LE &&
		scalarFunction.FuncName.L != ast.EQ {
		return false
	}
	column, _ := ValidCompareConstantPredicateHelper(ctx, scalarFunction, true)
	if column == nil {
		column, _ = ValidCompareConstantPredicateHelper(ctx, scalarFunction, false)
	}
	if column == nil {
		return false
	}
	return true
}

// ValidCompareConstantPredicateHelper checks if the predicate is a compare constant predicate, like "Column xxx Constant"
func ValidCompareConstantPredicateHelper(ctx EvalContext, eq *ScalarFunction, colIsLeft bool) (*Column, *Constant) {
	var col *Column
	var con *Constant
	colOk := false
	conOk := false
	if colIsLeft {
		col, colOk = eq.GetArgs()[0].(*Column)
	} else {
		col, colOk = eq.GetArgs()[1].(*Column)
	}
	if !colOk {
		return nil, nil
	}
	if colIsLeft {
		con, conOk = eq.GetArgs()[1].(*Constant)
	} else {
		con, conOk = eq.GetArgs()[0].(*Constant)
	}
	if !conOk {
		return nil, nil
	}
	if col.GetStaticType().GetCollate() != con.GetType(ctx).GetCollate() {
		return nil, nil
	}
	return col, con
}

// validEqualCond checks if the cond is an expression like [column eq constant].
func validEqualCond(ctx EvalContext, cond Expression) (*Column, *Constant) {
	if eq, ok := cond.(*ScalarFunction); ok {
		if eq.FuncName.L != ast.EQ {
			return nil, nil
		}
		col, con := ValidCompareConstantPredicateHelper(ctx, eq, true)
		if col == nil {
			return ValidCompareConstantPredicateHelper(ctx, eq, false)
		}
		return col, con
	}
	return nil, nil
}

// tryToReplaceCond aims to replace all occurrences of column 'src' and try to replace it with 'tgt' in 'cond'
// It returns
//
//	bool: if a replacement happened
//	bool: if 'cond' contains non-deterministic expression
//	Expression: the replaced expression, or original 'cond' if the replacement didn't happen
//
// For example:
//
//	for 'a, b, a < 3', it returns 'true, false, b < 3'
//	for 'a, b, sin(a) + cos(a) = 5', it returns 'true, false, returns sin(b) + cos(b) = 5'
//	for 'a, b, cast(a) < rand()', it returns 'false, true, cast(a) < rand()'
func tryToReplaceCond(ctx BuildContext, src *Column, tgt *Column, cond Expression, nullAware bool) (bool, bool, Expression) {
	if src.RetType.GetType() != tgt.RetType.GetType() {
		return false, false, cond
	}
	sf, ok := cond.(*ScalarFunction)
	if !ok {
		return false, false, cond
	}
	replaced := false
	var args []Expression
	if _, ok := unFoldableFunctions[sf.FuncName.L]; ok {
		return false, true, cond
	}
	if _, ok := inequalFunctions[sf.FuncName.L]; ok {
		return false, true, cond
	}
	// See
	//	https://github.com/pingcap/tidb/issues/15782
	//  https://github.com/pingcap/tidb/issues/17817
	// The null sensitive function's result may rely on the original nullable information of the outer side column.
	// Its args cannot be replaced easily.
	// A more strict check is that after we replace the arg. We check the nullability of the new expression.
	// But we haven't maintained it yet, so don't replace the arg of the control function currently.
	if nullAware &&
		(sf.FuncName.L == ast.Ifnull ||
			sf.FuncName.L == ast.If ||
			sf.FuncName.L == ast.Case ||
			sf.FuncName.L == ast.NullEQ) {
		return false, true, cond
	}
	for idx, expr := range sf.GetArgs() {
		if src.EqualColumn(expr) {
			_, coll := cond.CharsetAndCollation()
			if tgt.GetType(ctx.GetEvalCtx()).GetCollate() != coll {
				continue
			}
			replaced = true
			if args == nil {
				args = make([]Expression, len(sf.GetArgs()))
				copy(args, sf.GetArgs())
			}
			args[idx] = tgt
		} else {
			subReplaced, isNonDeterministic, subExpr := tryToReplaceCond(ctx, src, tgt, expr, nullAware)
			if isNonDeterministic {
				return false, true, cond
			} else if subReplaced {
				replaced = true
				if args == nil {
					args = make([]Expression, len(sf.GetArgs()))
					copy(args, sf.GetArgs())
				}
				args[idx] = subExpr
			}
		}
	}
	if replaced {
		return true, false, NewFunctionInternal(ctx, sf.FuncName.L, sf.GetType(ctx.GetEvalCtx()), args...)
	}
	return false, false, cond
}

var propConstSolverPool = sync.Pool{
	New: func() any {
		solver := &propConstSolver{
			basePropConstSolver: newBasePropConstSolver(),
			conditions:          make([]Expression, 0, 4),
		}
		return solver
	},
}

type propConstSolver struct {
	basePropConstSolver
	conditions []Expression
}

// newPropConstSolver returns a PropagateConstantSolver.
func newPropConstSolver() PropagateConstantSolver {
	solver := propConstSolverPool.Get().(*propConstSolver)
	return solver
}

// PropagateConstant propagate constant values of deterministic predicates in a condition.
func (s *propConstSolver) PropagateConstant(ctx exprctx.ExprContext, conditions []Expression) []Expression {
	s.ctx = ctx
	return s.solve(conditions)
}

// Clear clears the solver and returns it to the pool.
func (s *propConstSolver) Clear() {
	s.basePropConstSolver.Clear()
	s.conditions = s.conditions[:0]
	propConstSolverPool.Put(s)
}

// propagateConstantEQ propagates expressions like 'column = constant' by substituting the constant for column, the
// procedure repeats multiple times. An example runs as following:
// a = d & b * 2 = c & c = d + 2 & b = 1 & a = 4, we pick eq cond b = 1 and a = 4
// d = 4 & 2 = c & c = d + 2 & b = 1 & a = 4, we propagate b = 1 and a = 4 and pick eq cond c = 2 and d = 4
// d = 4 & 2 = c & false & b = 1 & a = 4, we propagate c = 2 and d = 4, and do constant folding: c = d + 2 will be folded as false.
func (s *propConstSolver) propagateConstantEQ() {
	intest.Assert(len(s.eqMapper) == 0 && s.eqMapper != nil)
	visited := make([]bool, len(s.conditions))
	cols := make([]*Column, 0, 4)
	cons := make([]Expression, 0, 4)
	for range MaxPropagateColsCnt {
		mapper := s.pickNewEQConds(visited)
		if len(mapper) == 0 {
			return
		}
		cols = slices.Grow(cols, len(mapper))
		cons = slices.Grow(cons, len(mapper))
		for id, con := range mapper {
			cols = append(cols, s.columns[id])
			cons = append(cons, con)
		}
		for i, cond := range s.conditions {
			if !visited[i] {
				s.conditions[i] = ColumnSubstitute(s.ctx, cond, NewSchema(cols...), cons)
			}
		}
		cols = cols[:0]
		cons = cons[:0]
	}
}

// propagateColumnEQ propagates expressions like 'column A = column B' by adding extra filters
// 'expression(..., column B, ...)' propagated from 'expression(..., column A, ...)' as long as:
//
//  1. The expression is deterministic
//  2. The expression doesn't have any side effect
//
// e.g. For expression a = b and b = c and c = d and c < 1 , we can get extra a < 1 and b < 1 and d < 1.
// However, for a = b and a < rand(), we cannot propagate a < rand() to b < rand() because rand() is non-deterministic
//
// This propagation may bring redundancies that we need to resolve later, for example:
// for a = b and a < 3 and b < 3, we get new a < 3 and b < 3, which are redundant
// for a = b and a < 3 and 3 > b, we get new b < 3 and 3 > a, which are redundant
// for a = b and a < 3 and b < 4, we get new a < 4 and b < 3 but should expect a < 3 and b < 3
// for a = b and a in (3) and b in (4), we get b in (3) and a in (4) but should expect 'false'
//
// TODO: remove redundancies later
//
// We maintain a unionSet representing the equivalent for every two columns.
func (s *propConstSolver) propagateColumnEQ() {
	visited := make([]bool, len(s.conditions))
	if s.unionSet == nil {
		s.unionSet = disjointset.NewIntSet(len(s.columns))
	} else {
		s.unionSet.GrowNewIntSet(len(s.columns))
	}
	for i := range s.conditions {
		if fun, ok := s.conditions[i].(*ScalarFunction); ok && fun.FuncName.L == ast.EQ {
			lCol, lOk := fun.GetArgs()[0].(*Column)
			rCol, rOk := fun.GetArgs()[1].(*Column)
			// TODO: Enable hybrid types in ConstantPropagate.
			if lOk && rOk && lCol.GetType(s.ctx.GetEvalCtx()).GetCollate() == rCol.GetType(s.ctx.GetEvalCtx()).GetCollate() && !lCol.GetType(s.ctx.GetEvalCtx()).Hybrid() && !rCol.GetType(s.ctx.GetEvalCtx()).Hybrid() {
				lID := s.getColID(lCol)
				rID := s.getColID(rCol)
				s.unionSet.Union(lID, rID)
				visited[i] = true
			}
		}
	}

	condsLen := len(s.conditions)
	for i, coli := range s.columns {
		for j := i + 1; j < len(s.columns); j++ {
			// unionSet doesn't have iterate(), we use a two layer loop to iterate col_i = col_j relation
			if s.unionSet.FindRoot(i) != s.unionSet.FindRoot(j) {
				continue
			}
			colj := s.columns[j]
			for k := range condsLen {
				if visited[k] {
					// cond_k has been used to retrieve equality relation
					continue
				}
				cond := s.conditions[k]
				replaced, _, newExpr := tryToReplaceCond(s.ctx, coli, colj, cond, false)
				if replaced {
					s.conditions = append(s.conditions, newExpr)
				}
				replaced, _, newExpr = tryToReplaceCond(s.ctx, colj, coli, cond, false)
				if replaced {
					s.conditions = append(s.conditions, newExpr)
				}
			}
		}
	}
}

func (s *propConstSolver) setConds2ConstFalse() {
	if MaybeOverOptimized4PlanCache(s.ctx, s.conditions...) {
		s.ctx.SetSkipPlanCache("some parameters may be overwritten when constant propagation")
	}
	s.conditions = s.conditions[:0]
	s.conditions = append(s.conditions, &Constant{
		Value:   types.NewDatum(false),
		RetType: types.NewFieldType(mysql.TypeTiny),
	})
}

// pickNewEQConds tries to pick new equal conds and puts them to retMapper.
func (s *propConstSolver) pickNewEQConds(visited []bool) (retMapper map[int]*Constant) {
	retMapper = make(map[int]*Constant)
	for i, cond := range s.conditions {
		if visited[i] {
			continue
		}
		col, con := validEqualCond(s.ctx.GetEvalCtx(), cond)
		// Then we check if this CNF item is a false constant. If so, we will set the whole condition to false.
		var ok bool
		if col == nil {
			con, ok = cond.(*Constant)
			if !ok {
				continue
			}
			visited[i] = true
			value, _, err := EvalBool(s.ctx.GetEvalCtx(), []Expression{con}, chunk.Row{})
			if err != nil {
				terror.Log(err)
				return nil
			}
			if !value {
				s.setConds2ConstFalse()
				return nil
			}
			continue
		}
		// TODO: Enable hybrid types in ConstantPropagate.
		if col.GetType(s.ctx.GetEvalCtx()).Hybrid() {
			continue
		}
		visited[i] = true
		updated, foreverFalse := s.tryToUpdateEQList(col, con)
		if foreverFalse {
			s.setConds2ConstFalse()
			return nil
		}
		if updated {
			retMapper[s.getColID(col)] = con
		}
	}
	return
}

func (s *propConstSolver) solve(conditions []Expression) []Expression {
	s.conditions = slices.Grow(s.conditions, len(conditions))
	for _, cond := range conditions {
		s.conditions = append(s.conditions, SplitCNFItems(cond)...)
		s.insertCols(ExtractColumns(cond)...)
	}
	if len(s.columns) > MaxPropagateColsCnt {
		logutil.BgLogger().Warn("too many columns in a single CNF",
			zap.Int("numCols", len(s.columns)),
			zap.Int("maxNumCols", MaxPropagateColsCnt),
		)
		return conditions
	}
	s.propagateConstantEQ()
	s.propagateColumnEQ()
	s.conditions = propagateConstantDNF(s.ctx, s.conditions...)
	s.conditions = RemoveDupExprs(s.conditions)
	return slices.Clone(s.conditions)
}

// PropagateConstant propagate constant values of deterministic predicates in a condition.
// This is a constant propagation logic for expression list such as ['a=1', 'a=b']
func PropagateConstant(ctx exprctx.ExprContext, conditions ...Expression) []Expression {
	if len(conditions) == 0 {
		return conditions
	}
	solver := newPropConstSolver()
	defer func() {
		solver.Clear()
	}()
	return solver.PropagateConstant(exprctx.WithConstantPropagateCheck(ctx), conditions)
}

var propSpecialJoinConstSolverPool = sync.Pool{
	New: func() any {
		solver := &propSpecialJoinConstSolver{
			basePropConstSolver: newBasePropConstSolver(),
			joinConds:           make([]Expression, 0, 4),
			filterConds:         make([]Expression, 0, 4),
		}
		return solver
	},
}

type propSpecialJoinConstSolver struct {
	basePropConstSolver
	joinConds   []Expression
	filterConds []Expression
	outerSchema *Schema
	innerSchema *Schema
	// nullSensitive indicates if this outer join is null sensitive, if true, we cannot generate
	// additional `col is not null` condition from column equal conditions. Specifically, this value
	// is true for LeftOuterSemiJoin, AntiLeftOuterSemiJoin and AntiSemiJoin.
	nullSensitive bool
}

func newPropSpecialJoinConstSolver() *propSpecialJoinConstSolver {
	solver := propSpecialJoinConstSolverPool.Get().(*propSpecialJoinConstSolver)
	return solver
}

// clear resets the solver.
func (s *propSpecialJoinConstSolver) Clear() {
	s.basePropConstSolver.Clear()
	s.joinConds = s.joinConds[:0]
	s.filterConds = s.filterConds[:0]
	s.outerSchema = nil
	s.innerSchema = nil
	s.nullSensitive = false
	propSpecialJoinConstSolverPool.Put(s)
}

func (s *propSpecialJoinConstSolver) setConds2ConstFalse(filterConds bool) {
	s.joinConds = s.joinConds[:0]
	s.joinConds = append(s.joinConds, &Constant{
		Value:   types.NewDatum(false),
		RetType: types.NewFieldType(mysql.TypeTiny),
	})
	if filterConds {
		s.filterConds = s.filterConds[:0]
		s.filterConds = append(s.filterConds, &Constant{
			Value:   types.NewDatum(false),
			RetType: types.NewFieldType(mysql.TypeTiny),
		})
	}
}

func (s *basePropConstSolver) dealWithPossibleHybridType(col *Column, con *Constant) (*Constant, bool) {
	if !col.GetType(s.ctx.GetEvalCtx()).Hybrid() {
		return con, true
	}
	if col.GetType(s.ctx.GetEvalCtx()).GetType() == mysql.TypeEnum {
		d, err := con.Eval(s.ctx.GetEvalCtx(), chunk.Row{})
		if err != nil {
			return nil, false
		}
		if MaybeOverOptimized4PlanCache(s.ctx, con) {
			s.ctx.SetSkipPlanCache("Skip plan cache since mutable constant is restored and propagated")
		}
		switch d.Kind() {
		case types.KindInt64:
			enum, err := types.ParseEnumValue(col.GetType(s.ctx.GetEvalCtx()).GetElems(), uint64(d.GetInt64()))
			if err != nil {
				logutil.BgLogger().Debug("Invalid Enum parsed during constant propagation")
				return nil, false
			}
			con = &Constant{
				Value:         types.NewMysqlEnumDatum(enum),
				RetType:       col.RetType.Clone(),
				collationInfo: col.collationInfo,
			}
		case types.KindString:
			enum, err := types.ParseEnumName(col.GetType(s.ctx.GetEvalCtx()).GetElems(), d.GetString(), d.Collation())
			if err != nil {
				logutil.BgLogger().Debug("Invalid Enum parsed during constant propagation")
				return nil, false
			}
			con = &Constant{
				Value:         types.NewMysqlEnumDatum(enum),
				RetType:       col.RetType.Clone(),
				collationInfo: col.collationInfo,
			}
		case types.KindMysqlEnum, types.KindMysqlSet:
			// It's already a hybrid type. Just use it.
		default:
			// We skip other cases first.
			return nil, false
		}
		return con, true
	}
	return nil, false
}

// pickEQCondsOnOuterCol picks constant equal expression from specified conditions.
func (s *propSpecialJoinConstSolver) pickEQCondsOnOuterCol(retMapper map[int]*Constant, visited []bool, filterConds bool) map[int]*Constant {
	var conds []Expression
	var condsOffset int
	if filterConds {
		conds = s.filterConds
	} else {
		conds = s.joinConds
		condsOffset = len(s.filterConds)
	}
	for i, cond := range conds {
		if visited[i+condsOffset] {
			continue
		}
		col, con := validEqualCond(s.ctx.GetEvalCtx(), cond)
		// Then we check if this CNF item is a false constant. If so, we will set the whole condition to false.
		var ok bool
		if col == nil {
			con, ok = cond.(*Constant)
			if !ok {
				continue
			}
			visited[i+condsOffset] = true
			value, _, err := EvalBool(s.ctx.GetEvalCtx(), []Expression{con}, chunk.Row{})
			if err != nil {
				terror.Log(err)
				return nil
			}
			if !value {
				s.setConds2ConstFalse(filterConds)
				return nil
			}
			continue
		}
		var valid bool
		con, valid = s.dealWithPossibleHybridType(col, con)
		if !valid {
			continue
		}
		// Only extract `outerCol = const` expressions.
		if !s.outerSchema.Contains(col) {
			continue
		}
		visited[i+condsOffset] = true
		updated, foreverFalse := s.tryToUpdateEQList(col, con)
		if foreverFalse {
			s.setConds2ConstFalse(filterConds)
			return nil
		}
		if updated {
			retMapper[s.getColID(col)] = con
		}
	}
	return retMapper
}

// pickNewEQConds picks constant equal expressions from join and filter conditions.
func (s *propSpecialJoinConstSolver) pickNewEQConds(visited []bool) map[int]*Constant {
	retMapper := make(map[int]*Constant)
	retMapper = s.pickEQCondsOnOuterCol(retMapper, visited, true)
	if retMapper == nil {
		// Filter is constant false or error occurred, enforce early termination.
		return nil
	}
	retMapper = s.pickEQCondsOnOuterCol(retMapper, visited, false)
	return retMapper
}

// propagateConstantEQ propagates expressions like `outerCol = const` by substituting `outerCol` in *JOIN* condition
// with `const`, the procedure repeats multiple times.
func (s *propSpecialJoinConstSolver) propagateConstantEQ() {
	clear(s.eqMapper)
	lenFilters := len(s.filterConds)
	visited := make([]bool, lenFilters+len(s.joinConds))
	for range MaxPropagateColsCnt {
		mapper := s.pickNewEQConds(visited)
		if len(mapper) == 0 {
			return
		}
		cols := make([]*Column, 0, len(mapper))
		cons := make([]Expression, 0, len(mapper))
		for id, con := range mapper {
			cols = append(cols, s.columns[id])
			cons = append(cons, con)
		}
		for i, cond := range s.joinConds {
			if !visited[i+lenFilters] {
				s.joinConds[i] = ColumnSubstitute(s.ctx, cond, NewSchema(cols...), cons)
			}
		}
	}
}

func (s *propSpecialJoinConstSolver) colsFromOuterAndInner(col1, col2 *Column) (*Column, *Column) {
	if s.outerSchema.Contains(col1) && s.innerSchema.Contains(col2) {
		return col1, col2
	}
	if s.outerSchema.Contains(col2) && s.innerSchema.Contains(col1) {
		return col2, col1
	}
	return nil, nil
}

// validColEqualCond checks if expression is column equal condition that we can use for constant
// propagation over outer join. We only use expression like `outerCol = innerCol`, for expressions like
// `outerCol1 = outerCol2` or `innerCol1 = innerCol2`, they do not help deriving new inner table conditions
// which can be pushed down to children plan nodes, so we do not pick them.
func (s *propSpecialJoinConstSolver) validColEqualCond(cond Expression) (*Column, *Column) {
	if fun, ok := cond.(*ScalarFunction); ok && fun.FuncName.L == ast.EQ {
		lCol, lOk := fun.GetArgs()[0].(*Column)
		rCol, rOk := fun.GetArgs()[1].(*Column)
		if lOk && rOk && lCol.GetType(s.ctx.GetEvalCtx()).GetCollate() == rCol.GetType(s.ctx.GetEvalCtx()).GetCollate() {
			return s.colsFromOuterAndInner(lCol, rCol)
		}
	}
	return nil, nil
}

// deriveConds given `outerCol = innerCol`, derive new expression for specified conditions.
func (s *propSpecialJoinConstSolver) deriveConds(outerCol, innerCol *Column, schema *Schema, fCondsOffset int, visited []bool, filterConds bool) []bool {
	var offset, condsLen int
	var conds []Expression
	if filterConds {
		conds = s.filterConds
		offset = fCondsOffset
		condsLen = len(s.filterConds)
	} else {
		conds = s.joinConds
		condsLen = fCondsOffset
	}
	for k := range condsLen {
		if visited[k+offset] {
			// condition has been used to retrieve equality relation or contains column beyond children schema.
			continue
		}
		cond := conds[k]
		if !ExprFromSchema(cond, schema) {
			visited[k+offset] = true
			continue
		}
		replaced, _, newExpr := tryToReplaceCond(s.ctx, outerCol, innerCol, cond, true)
		if replaced {
			s.joinConds = append(s.joinConds, newExpr)
		}
	}
	return visited
}

// propagateColumnEQ propagates expressions like 'outerCol = innerCol' by adding extra filters
// 'expression(..., innerCol, ...)' derived from 'expression(..., outerCol, ...)' as long as
// 'expression(..., outerCol, ...)' does not reference columns outside children schemas of join node.
// Derived new expressions must be appended into join condition, not filter condition.
func (s *propSpecialJoinConstSolver) propagateColumnEQ() {
	if s.nullSensitive {
		return
	}
	visited := make([]bool, 2*len(s.joinConds)+len(s.filterConds))
	if s.unionSet == nil {
		s.unionSet = disjointset.NewIntSet(len(s.columns))
	} else {
		s.unionSet.GrowNewIntSet(len(s.columns))
	}
	var outerCol, innerCol *Column
	// Only consider column equal condition in joinConds.
	// If we have column equal in filter condition, the outer join should have been simplified already.
	for i := range s.joinConds {
		outerCol, innerCol = s.validColEqualCond(s.joinConds[i])
		if outerCol != nil {
			outerID := s.getColID(outerCol)
			innerID := s.getColID(innerCol)
			s.unionSet.Union(outerID, innerID)
			visited[i] = true
			// Generate `innerCol is not null` from `outerCol = innerCol`. Note that `outerCol is not null`
			// does not hold since we are in outer join.
			// For AntiLeftOuterSemiJoin, this does not work, for example:
			// `select *, t1.a not in (select t2.b from t t2) from t t1` does not imply `t2.b is not null`.
			// For LeftOuterSemiJoin, this does not work either, for example:
			// `select *, t1.a in (select t2.b from t t2) from t t1`
			// rows with t2.b is null would impact whether LeftOuterSemiJoin should output 0 or null if there
			// is no row satisfying t2.b = t1.a
			childCol := s.innerSchema.RetrieveColumn(innerCol)
			if !mysql.HasNotNullFlag(childCol.RetType.GetFlag()) {
				notNullExpr := BuildNotNullExpr(s.ctx, childCol)
				s.joinConds = append(s.joinConds, notNullExpr)
			}
		}
	}
	lenJoinConds := len(s.joinConds)
	mergedSchema := MergeSchema(s.outerSchema, s.innerSchema)
	for i, coli := range s.columns {
		for j := i + 1; j < len(s.columns); j++ {
			// unionSet doesn't have iterate(), we use a two layer loop to iterate col_i = col_j relation.
			if s.unionSet.FindRoot(i) != s.unionSet.FindRoot(j) {
				continue
			}
			colj := s.columns[j]
			outerCol, innerCol = s.colsFromOuterAndInner(coli, colj)
			if outerCol == nil {
				continue
			}
			visited = s.deriveConds(outerCol, innerCol, mergedSchema, lenJoinConds, visited, false)
			visited = s.deriveConds(outerCol, innerCol, mergedSchema, lenJoinConds, visited, true)
		}
	}
}

func (s *propSpecialJoinConstSolver) solve(joinConds, filterConds []Expression) ([]Expression, []Expression) {
	for _, cond := range joinConds {
		s.joinConds = append(s.joinConds, SplitCNFItems(cond)...)
		s.insertCols(ExtractColumns(cond)...)
	}
	for _, cond := range filterConds {
		s.filterConds = append(s.filterConds, SplitCNFItems(cond)...)
		s.insertCols(ExtractColumns(cond)...)
	}
	if len(s.columns) > MaxPropagateColsCnt {
		logutil.BgLogger().Warn("too many columns",
			zap.Int("numCols", len(s.columns)),
			zap.Int("maxNumCols", MaxPropagateColsCnt),
		)
		return joinConds, filterConds
	}
	s.propagateConstantEQ()
	s.propagateColumnEQ()
	s.joinConds = propagateConstantDNF(s.ctx, s.joinConds...)
	s.filterConds = propagateConstantDNF(s.ctx, s.filterConds...)
	return slices.Clone(s.joinConds), slices.Clone(s.filterConds)
}

// propagateConstantDNF find DNF item from CNF, and propagate constant inside DNF.
func propagateConstantDNF(ctx exprctx.ExprContext, conds ...Expression) []Expression {
	for i, cond := range conds {
		if dnf, ok := cond.(*ScalarFunction); ok && dnf.FuncName.L == ast.LogicOr {
			dnfItems := SplitDNFItems(cond)
			for j, item := range dnfItems {
				dnfItems[j] = ComposeCNFCondition(ctx, PropagateConstant(ctx, item)...)
			}
			conds[i] = ComposeDNFCondition(ctx, dnfItems...)
		}
	}
	return conds
}

// PropConstOverSpecialJoin propagate constant equal and column equal conditions over outer join or anti semi join.
// First step is to extract `outerCol = const` from join conditions and filter conditions,
// and substitute `outerCol` in join conditions with `const`;
// Second step is to extract `outerCol = innerCol` from join conditions, and derive new join
// conditions based on this column equal condition and `outerCol` related
// expressions in join conditions and filter conditions;
func PropConstOverSpecialJoin(ctx exprctx.ExprContext, joinConds, filterConds []Expression,
	outerSchema, innerSchema *Schema, nullSensitive bool) ([]Expression, []Expression) {
	solver := newPropSpecialJoinConstSolver()
	defer func() {
		solver.Clear()
	}()
	solver.outerSchema = outerSchema
	solver.innerSchema = innerSchema
	solver.nullSensitive = nullSensitive
	solver.ctx = ctx
	return solver.solve(joinConds, filterConds)
}

// PropagateConstantSolver is a constant propagate solver.
type PropagateConstantSolver interface {
	PropagateConstant(ctx exprctx.ExprContext, conditions []Expression) []Expression
	Clear()
}
