// Copyright 2023 PingCAP, Inc.
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

package cardinality_test

import (
	"context"
	"fmt"
	"math"
	"os"
	"runtime/pprof"
	"slices"
	"strconv"
	"strings"
	"testing"
	"time"

	"github.com/pingcap/failpoint"
	"github.com/pingcap/tidb/pkg/domain"
	"github.com/pingcap/tidb/pkg/kv"
	"github.com/pingcap/tidb/pkg/meta/model"
	"github.com/pingcap/tidb/pkg/parser/ast"
	"github.com/pingcap/tidb/pkg/parser/mysql"
	"github.com/pingcap/tidb/pkg/planner/cardinality"
	plannercore "github.com/pingcap/tidb/pkg/planner/core"
	"github.com/pingcap/tidb/pkg/planner/core/base"
	"github.com/pingcap/tidb/pkg/planner/core/operator/logicalop"
	"github.com/pingcap/tidb/pkg/planner/core/resolve"
	"github.com/pingcap/tidb/pkg/session"
	"github.com/pingcap/tidb/pkg/sessionctx"
	"github.com/pingcap/tidb/pkg/sessionctx/stmtctx"
	"github.com/pingcap/tidb/pkg/sessionctx/vardef"
	"github.com/pingcap/tidb/pkg/statistics"
	statstestutil "github.com/pingcap/tidb/pkg/statistics/handle/ddl/testutil"
	"github.com/pingcap/tidb/pkg/testkit"
	"github.com/pingcap/tidb/pkg/testkit/testdata"
	"github.com/pingcap/tidb/pkg/types"
	"github.com/pingcap/tidb/pkg/util/codec"
	"github.com/pingcap/tidb/pkg/util/collate"
	"github.com/pingcap/tidb/pkg/util/mock"
	"github.com/pingcap/tidb/pkg/util/ranger"
	"github.com/stretchr/testify/require"
)

func TestCollationColumnEstimate(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t")
	tk.MustExec("create table t(a varchar(20) collate utf8mb4_general_ci)")
	tk.MustExec("insert into t values('aaa'), ('bbb'), ('AAA'), ('BBB')")
	tk.MustExec("set @@session.tidb_analyze_version=2")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	tk.MustExec("analyze table t all columns")
	tk.MustExec("explain select * from t where a = 'aaa'")
	require.Nil(t, h.LoadNeededHistograms(dom.InfoSchema()))
	var (
		input  []string
		output [][]string
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i] = testdata.ConvertRowsToStrings(tk.MustQuery(input[i]).Rows())
		})
		tk.MustQuery(input[i]).Check(testkit.Rows(output[i]...))
	}
}

func BenchmarkSelectivity(b *testing.B) {
	store, dom := testkit.CreateMockStoreAndDomain(b)
	testKit := testkit.NewTestKit(b, store)
	statsTbl, err := prepareSelectivity(testKit, dom)
	require.NoError(b, err)
	exprs := "a > 1 and b < 2 and c > 3 and d < 4 and e > 5"
	sql := "select * from t where " + exprs
	sctx := testKit.Session().(sessionctx.Context)
	stmts, err := session.Parse(sctx, sql)
	require.NoErrorf(b, err, "error %v, for expr %s", err, exprs)
	require.Len(b, stmts, 1)
	ret := &plannercore.PreprocessorReturn{}
	nodeW := resolve.NewNodeW(stmts[0])
	err = plannercore.Preprocess(context.Background(), sctx, nodeW, plannercore.WithPreprocessorReturn(ret))
	require.NoErrorf(b, err, "for %s", exprs)
	p, err := plannercore.BuildLogicalPlanForTest(context.Background(), sctx, nodeW, ret.InfoSchema)
	require.NoErrorf(b, err, "error %v, for building plan, expr %s", err, exprs)

	file, err := os.Create("cpu.profile")
	require.NoError(b, err)
	defer func() {
		err := file.Close()
		require.NoError(b, err)
	}()
	err = pprof.StartCPUProfile(file)
	require.NoError(b, err)

	b.Run("Selectivity", func(b *testing.B) {
		b.ResetTimer()
		for i := 0; i < b.N; i++ {
			_, _, err := cardinality.Selectivity(sctx.GetPlanCtx(), &statsTbl.HistColl, p.(base.LogicalPlan).Children()[0].(*logicalop.LogicalSelection).Conditions, nil)
			require.NoError(b, err)
		}
		b.ReportAllocs()
	})
	pprof.StopCPUProfile()
}

func TestOutOfRangeEstimation(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int unsigned, index idx(a))")
	for i := range 3000 {
		testKit.MustExec(fmt.Sprintf("insert into t values (%v)", i/5+300)) // [300, 900)
	}
	testKit.MustExec("analyze table t with 2000 samples")

	h := dom.StatsHandle()
	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := h.GetTableStats(table.Meta())
	sctx := mock.NewContext()
	col := statsTbl.GetCol(table.Meta().Columns[0].ID)
	count, err := cardinality.GetColumnRowCount(sctx, col, getRange(900, 900), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)
	// Because the ANALYZE collect data by random sampling, so the result is not an accurate value.
	// so we use a range here.
	require.Truef(t, count < 5.5, "expected: around 5.0, got: %v", count)
	require.Truef(t, count > 4.5, "expected: around 5.0, got: %v", count)

	var input []struct {
		Start int64
		End   int64
	}
	var output []struct {
		Start int64
		End   int64
		Count float64
	}
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	increasedTblRowCount := int64(float64(statsTbl.RealtimeCount) * 1.5)
	modifyCount := int64(float64(statsTbl.RealtimeCount) * 0.5)
	for i, ran := range input {
		count, err = cardinality.GetColumnRowCount(sctx, col, getRange(ran.Start, ran.End), increasedTblRowCount, modifyCount, false)
		require.NoError(t, err)
		testdata.OnRecord(func() {
			output[i].Start = ran.Start
			output[i].End = ran.End
			output[i].Count = count
		})
		require.Truef(t, count < output[i].Count*1.2, "for [%v, %v], needed: around %v, got: %v", ran.Start, ran.End, output[i].Count, count)
		require.Truef(t, count > output[i].Count*0.8, "for [%v, %v], needed: around %v, got: %v", ran.Start, ran.End, output[i].Count, count)
	}
}

// TestOutOfRangeEstimationAfterDelete tests the out-of-range estimation after deletion happen.
// The test result doesn't perfectly reflect the actual data distribution, but this is the expected behavior for now.
func TestOutOfRangeEstimationAfterDelete(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int unsigned)")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	// [300, 900)
	// 5 rows for each value, 3000 rows in total.
	for i := range 3000 {
		testKit.MustExec(fmt.Sprintf("insert into t values (%v)", i/5+300))
	}
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	testKit.MustExec("analyze table t all columns with 1 samplerate, 0 topn")
	// Data in [300, 500), 1000 rows in total, are deleted.
	// 2000 rows left.
	testKit.MustExec("delete from t where a < 500")
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))
	var (
		input  []string
		output []struct {
			SQL    string
			Result []string
		}
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i].SQL = input[i]
		})
		if strings.HasPrefix(input[i], "explain") {
			testdata.OnRecord(func() {
				output[i].Result = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
			})
			testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
		} else {
			testKit.MustExec(input[i])
		}
	}
}

func TestEstimationForUnknownValues(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, key idx(a, b))")
	testKit.MustExec("set @@tidb_analyze_version=1")
	testKit.MustExec("analyze table t")
	for i := range 10 {
		testKit.MustExec(fmt.Sprintf("insert into t values (%d, %d)", i, i))
	}
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	testKit.MustExec("analyze table t")
	for i := range 10 {
		testKit.MustExec(fmt.Sprintf("insert into t values (%d, %d)", i+10, i+10))
	}
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))
	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := h.GetTableStats(table.Meta())

	sctx := mock.NewContext()
	colID := table.Meta().Columns[0].ID
	count, err := cardinality.GetRowCountByColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(30, 30))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	count, err = cardinality.GetRowCountByColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(9, 30))
	require.NoError(t, err)
	require.Equal(t, 4.7, count)

	count, err = cardinality.GetRowCountByColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(9, math.MaxInt64))
	require.NoError(t, err)
	require.Equal(t, 4.7, count)

	idxID := table.Meta().Indices[0].ID
	count, _, err = cardinality.GetRowCountByIndexRanges(sctx, &statsTbl.HistColl, idxID, getRange(30, 30))
	require.NoError(t, err)
	require.Equal(t, 0.1, count)

	count, _, err = cardinality.GetRowCountByIndexRanges(sctx, &statsTbl.HistColl, idxID, getRange(9, 30))
	require.NoError(t, err)
	require.Equal(t, 4.5, count)

	testKit.MustExec("truncate table t")
	testKit.MustExec("insert into t values (null, null)")
	testKit.MustExec("analyze table t")
	table, err = dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl = h.GetTableStats(table.Meta())

	colID = table.Meta().Columns[0].ID
	count, err = cardinality.GetRowCountByColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(1, 30))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	testKit.MustExec("drop table t")
	testKit.MustExec("create table t(a int, b int, index idx(b))")
	testKit.MustExec("insert into t values (1,1)")
	testKit.MustExec("analyze table t")
	table, err = dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl = h.GetTableStats(table.Meta())

	colID = table.Meta().Columns[0].ID
	count, err = cardinality.GetRowCountByColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(2, 2))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	idxID = table.Meta().Indices[0].ID
	count, _, err = cardinality.GetRowCountByIndexRanges(sctx, &statsTbl.HistColl, idxID, getRange(2, 2))
	require.NoError(t, err)
	require.Equal(t, 0.0, count)
}

func TestEstimationForUnknownValuesAfterModify(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, key idx(a))")
	testKit.MustExec("set @@tidb_analyze_version=2")
	testKit.MustExec("set @@global.tidb_enable_auto_analyze='OFF'")
	for i := 1; i <= 10; i++ {
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t select a from t where a = %d", i))
	}
	testKit.MustExec("analyze table t")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))

	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := h.GetTableStats(table.Meta())

	// Search for a found value == 10.0
	sctx := mock.NewContext()
	col := statsTbl.GetCol(table.Meta().Columns[0].ID)
	count, err := cardinality.GetColumnRowCount(sctx, col, getRange(5, 5), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)
	require.Equal(t, 10.0, count)

	// Search for a not found value with zero modifyCount. Defaults to count == 1.0
	count, err = cardinality.GetColumnRowCount(sctx, col, getRange(11, 11), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	// Add another 200 rows to the table
	testKit.MustExec("insert into t select a+10 from t")
	testKit.MustExec("insert into t select a+10 from t where a <= 10")
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))
	statsTblNew := h.GetTableStats(table.Meta())

	// Search for a not found value based upon statistics - count should be > 20 and < 40
	count, err = cardinality.GetColumnRowCount(sctx, col, getRange(15, 15), statsTblNew.RealtimeCount, statsTblNew.ModifyCount, false)
	require.NoError(t, err)
	require.Truef(t, count < 40, "expected: between 20 to 40, got: %v", count)
	require.Truef(t, count > 20, "expected: between 20 to 40, got: %v", count)
}

func TestNewIndexWithoutStats(t *testing.T) {
	// Test where there exists multple indexes - but (at least) one index does not have statistics
	// Test 1) Prioritizing an index with stats vs one without - when both have the same number of equal predicates,
	// Test 2) Prioritize the index with more equal predicates regardless
	store, _ := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int, index idxa(a), index idxca(c,a))")
	testKit.MustExec("set @@tidb_analyze_version=2")
	testKit.MustExec("set @@global.tidb_enable_auto_analyze='OFF'")
	testKit.MustExec("insert into t values (1, 1, 1)")
	testKit.MustExec("insert into t select mod(a,250), mod(a,10), mod(a,100) from (with recursive x as (select 1 as a union all select a + 1 AS a from x where a < 500) select a from x) as subquery")
	testKit.MustExec("analyze table t")
	testKit.MustExec("create index idxb on t(b)")
	// Create index after ANALYZE. SkyLine pruning should ensure that idxa is chosen because it has statistics
	testKit.MustQuery("explain format='brief' select * from t where a = 5 and b = 5").CheckContain("idxa(a)")
	testKit.MustExec("analyze table t")
	// idxa should still win after statistics
	testKit.MustQuery("explain format='brief' select * from t where a = 5 and b = 5").CheckContain("idxa(a)")
	testKit.MustExec("create index idxab on t(a, b)")
	// New index idxab should win due to having the most matching equal predicates - regardless of no statistics
	testKit.MustQuery("explain format='brief' select * from t where a = 5 and b = 5").CheckContain("idxab(a, b)")
	// New index idxab should win due to having the most predicates - regardless of no statistics
	testKit.MustQuery("explain format='brief' select * from t where a > 5 and b > 5").CheckContain("idxab(a, b)")
	testKit.MustQuery("explain format='brief' select * from t where a = 5 and b > 5 and c > 5").CheckContain("idxab(a, b)")
	// New index idxab should NOT win because idxca has the same number of equals and has statistics
	testKit.MustQuery("explain format='brief' select * from t where a = 5 and b > 5 and c = 5").CheckContain("idxca(c, a)")
}

func TestIssue57948(t *testing.T) {
	// Similar to test (above) TestNewIndexWithoutStats
	// Test when only 1 index exists - prioritize that index if it is missing statistics
	store, _ := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int)")
	testKit.MustExec("set @@tidb_analyze_version=2")
	testKit.MustExec("set @@global.tidb_enable_auto_analyze='OFF'")
	testKit.MustExec("insert into t values (1, 1, 1)")
	testKit.MustExec("insert into t select mod(a,250), mod(a,10), mod(a,100) from (with recursive x as (select 1 as a union all select a + 1 AS a from x where a < 500) select a from x) as subquery")
	testKit.MustExec("analyze table t")
	testKit.MustExec("create index idxb on t(b)")
	// Create index after ANALYZE. SkyLine pruning should ensure that idxb is chosen because it has statistics
	testKit.MustQuery("explain format='brief' select * from t where b = 5").CheckContain("idxb(b)")
}

func TestEstimationUniqueKeyEqualConds(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int, unique key(b))")
	testKit.MustExec("insert into t values (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7)")
	testKit.MustExec("analyze table t all columns with 4 cmsketch width, 1 cmsketch depth;")
	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := dom.StatsHandle().GetTableStats(table.Meta())

	sctx := mock.NewContext()
	idxID := table.Meta().Indices[0].ID
	count, _, err := cardinality.GetRowCountByIndexRanges(sctx, &statsTbl.HistColl, idxID, getRange(7, 7))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	count, _, err = cardinality.GetRowCountByIndexRanges(sctx, &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	colID := table.Meta().Columns[0].ID
	count, err = cardinality.GetRowCountByIntColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(7, 7))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)

	count, err = cardinality.GetRowCountByIntColumnRanges(sctx, &statsTbl.HistColl, colID, getRange(6, 6))
	require.NoError(t, err)
	require.Equal(t, 1.0, count)
}

func TestColumnIndexNullEstimation(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int, index idx_b(b), index idx_c_a(c, a))")
	testKit.MustExec("insert into t values(1,null,1),(2,null,2),(3,3,3),(4,null,4),(null,null,null);")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	testKit.MustExec("analyze table t")
	var (
		input  []string
		output [][]string
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i := range 5 {
		testdata.OnRecord(func() {
			output[i] = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i]...))
	}
	// Make sure column stats has been loaded.
	testKit.MustExec(`explain select * from t where a is null`)
	require.Nil(t, h.LoadNeededHistograms(dom.InfoSchema()))
	for i := 5; i < len(input); i++ {
		testdata.OnRecord(func() {
			output[i] = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i]...))
	}
}

func TestUniqCompEqualEst(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.Session().GetSessionVars().EnableClusteredIndex = vardef.ClusteredIndexDefModeOn
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, primary key(a, b))")
	testKit.MustExec("insert into t values(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10)")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	testKit.MustExec("analyze table t")
	var (
		input  []string
		output [][]string
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i := range 1 {
		testdata.OnRecord(func() {
			output[i] = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i]...))
	}
}

func TestSelectivity(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	statsTbl, err := prepareSelectivity(testKit, dom)
	require.NoError(t, err)
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 0.3")
	longExpr := "0 < a and a = 1 "
	for i := 1; i < 64; i++ {
		longExpr += fmt.Sprintf(" and a > %d ", i)
	}
	tests := []struct {
		exprs                    string
		selectivity              float64
		selectivityAfterIncrease float64
	}{
		{
			exprs:                    "a > 0 and a < 2",
			selectivity:              0.01851851851,
			selectivityAfterIncrease: 0.01851851851,
		},
		{
			exprs:                    "a >= 1 and a < 2",
			selectivity:              0.01851851851,
			selectivityAfterIncrease: 0.01851851851,
		},
		{
			exprs:                    "a >= 1 and b > 1 and a < 2",
			selectivity:              0.018017832647462276,
			selectivityAfterIncrease: 0.018518518518518517,
		},
		{
			exprs:                    "a >= 1 and c > 1 and a < 2",
			selectivity:              0.006358024691358024,
			selectivityAfterIncrease: 0.01117283950617284,
		},
		{
			exprs:                    "a >= 1 and c >= 1 and a < 2",
			selectivity:              0.012530864197530862,
			selectivityAfterIncrease: 0.01734567901234568,
		},
		{
			exprs:                    "d = 0 and e = 1",
			selectivity:              0.11111111111,
			selectivityAfterIncrease: 0.11111111111,
		},
		{
			exprs:                    "b > 1",
			selectivity:              0.9729629629629629,
			selectivityAfterIncrease: 1,
		},
		{
			exprs:                    "a > 1 and b < 2 and c > 3 and d < 4 and e > 5",
			selectivity:              0.001851851851851852,
			selectivityAfterIncrease: 0.125425,
		},
		{
			exprs:                    longExpr,
			selectivity:              0.001,
			selectivityAfterIncrease: 0.001,
		},
	}

	ctx := context.Background()
	for _, tt := range tests {
		sql := "select * from t where " + tt.exprs
		sctx := testKit.Session().(sessionctx.Context)
		stmts, err := session.Parse(sctx, sql)
		require.NoErrorf(t, err, "for %s", tt.exprs)
		require.Len(t, stmts, 1)

		ret := &plannercore.PreprocessorReturn{}
		nodeW := resolve.NewNodeW(stmts[0])
		err = plannercore.Preprocess(context.Background(), sctx, nodeW, plannercore.WithPreprocessorReturn(ret))
		require.NoErrorf(t, err, "for expr %s", tt.exprs)
		p, err := plannercore.BuildLogicalPlanForTest(ctx, sctx, nodeW, ret.InfoSchema)
		require.NoErrorf(t, err, "for building plan, expr %s", err, tt.exprs)

		sel := p.(base.LogicalPlan).Children()[0].(*logicalop.LogicalSelection)
		ds := sel.Children()[0].(*logicalop.DataSource)

		histColl := statsTbl.GenerateHistCollFromColumnInfo(ds.TableInfo, ds.Schema().Columns)

		ratio, _, err := cardinality.Selectivity(sctx.GetPlanCtx(), histColl, sel.Conditions, nil)
		require.NoErrorf(t, err, "for %s", tt.exprs)
		require.Truef(t, math.Abs(ratio-tt.selectivity) < eps, "for %s, needed: %v, got: %v", tt.exprs, tt.selectivity, ratio)

		histColl.RealtimeCount *= 10
		histColl.ModifyCount = histColl.RealtimeCount * 9
		ratio, _, err = cardinality.Selectivity(sctx.GetPlanCtx(), histColl, sel.Conditions, nil)
		require.NoErrorf(t, err, "for %s", tt.exprs)
		require.Truef(t, math.Abs(ratio-tt.selectivityAfterIncrease) < eps, "for %s, needed: %v, got: %v", tt.exprs, tt.selectivityAfterIncrease, ratio)
	}
}

// TestDNFCondSelectivity tests selectivity calculation with DNF conditions covered by using independence assumption.
func TestDNFCondSelectivity(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int, d int, index idx(a, b, c, d))")
	testKit.MustExec("insert into t value(1,5,4,4),(3,4,1,8),(4,2,6,10),(6,7,2,5),(7,1,4,9),(8,9,8,3),(9,1,9,1),(10,6,6,2)")
	testKit.MustExec("alter table t add index (b)")
	testKit.MustExec("alter table t add index (d)")
	testKit.MustExec(`analyze table t`)

	ctx := context.Background()
	h := dom.StatsHandle()
	tb, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()
	statsTbl := h.GetTableStats(tblInfo)

	var (
		input  []string
		output []struct {
			SQL         string
			Selectivity float64
		}
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i, tt := range input {
		sctx := testKit.Session().(sessionctx.Context)
		stmts, err := session.Parse(sctx, tt)
		require.NoErrorf(t, err, "error %v, for sql %s", err, tt)
		require.Len(t, stmts, 1)

		ret := &plannercore.PreprocessorReturn{}
		nodeW := resolve.NewNodeW(stmts[0])
		err = plannercore.Preprocess(context.Background(), sctx, nodeW, plannercore.WithPreprocessorReturn(ret))
		require.NoErrorf(t, err, "error %v, for sql %s", err, tt)
		p, err := plannercore.BuildLogicalPlanForTest(ctx, sctx, nodeW, ret.InfoSchema)
		require.NoErrorf(t, err, "error %v, for building plan, sql %s", err, tt)

		sel := p.(base.LogicalPlan).Children()[0].(*logicalop.LogicalSelection)
		ds := sel.Children()[0].(*logicalop.DataSource)

		histColl := statsTbl.GenerateHistCollFromColumnInfo(ds.TableInfo, ds.Schema().Columns)

		ratio, _, err := cardinality.Selectivity(sctx.GetPlanCtx(), histColl, sel.Conditions, nil)
		require.NoErrorf(t, err, "error %v, for expr %s", err, tt)
		testdata.OnRecord(func() {
			output[i].SQL = tt
			output[i].Selectivity = ratio
		})
		require.Truef(t, math.Abs(ratio-output[i].Selectivity) < eps, "for %s, needed: %v, got: %v", tt, output[i].Selectivity, ratio)
	}

	// Test issue 19981
	testKit.MustExec("select * from t where _tidb_rowid is null or _tidb_rowid > 7")

	// Test issue 22134
	// Information about column n will not be in stats immediately after this SQL executed.
	// If we don't have a check against this, DNF condition could lead to infinite recursion in  cardinality.Selectivity().
	testKit.MustExec("alter table t add column n timestamp;")
	testKit.MustExec("select * from t where n = '2000-01-01' or n = '2000-01-02';")

	// Test issue 27294
	testKit.MustExec("create table tt (COL1 blob DEFAULT NULL,COL2 decimal(37,4) DEFAULT NULL,COL3 timestamp NULL DEFAULT NULL,COL4 int(11) DEFAULT NULL,UNIQUE KEY U_M_COL4(COL1(10),COL2), UNIQUE KEY U_M_COL5(COL3,COL2));")
	testKit.MustExec("explain select * from tt where col1 is not null or col2 not between 454623814170074.2771 and -975540642273402.9269 and col3 not between '2039-1-19 10:14:57' and '2002-3-27 14:40:23';")
}

func TestIndexEstimationCrossValidate(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t")
	tk.MustExec("create table t(a int, b int, key(a,b))")
	tk.MustExec("insert into t values(1, 1), (1, 2), (1, 3), (2, 2)")
	tk.MustExec("analyze table t")
	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/statistics/table/mockQueryBytesMaxUint64", `return(100000)`))
	tk.MustQuery("explain select * from t where a = 1 and b = 2").Check(testkit.Rows(
		"IndexReader_7 1.00 root  index:IndexRangeScan_6",
		"└─IndexRangeScan_6 1.00 cop[tikv] table:t, index:a(a, b) range:[1 2,1 2], keep order:false"))
	require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/statistics/table/mockQueryBytesMaxUint64"))

	// Test issue 22466
	tk.MustExec("drop table if exists t2")
	tk.MustExec("create table t2(a int, b int, key b(b))")
	tk.MustExec("insert into t2 values(1, 1), (2, 2), (3, 3), (4, 4), (5,5)")
	// This line of select will mark column b stats as needed, and an invalid(empty) stats for column b
	// will be loaded at the next analyze line, this will trigger the bug.
	tk.MustQuery("select * from t2 where b=2")
	tk.MustExec("analyze table t2 index b")
	tk.MustQuery("explain select * from t2 where b=2").Check(testkit.Rows(
		"TableReader_8 1.00 root  data:Selection_7",
		"└─Selection_7 1.00 cop[tikv]  eq(test.t2.b, 2)",
		"  └─TableFullScan_6 5.00 cop[tikv] table:t2 keep order:false"))
}

func TestRangeStepOverflow(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t")
	tk.MustExec("create table t (col datetime)")
	tk.MustExec("insert into t values('3580-05-26 07:16:48'),('4055-03-06 22:27:16'),('4862-01-26 07:16:54')")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	tk.MustExec("analyze table t")
	// Trigger the loading of column stats.
	tk.MustQuery("select * from t where col between '8499-1-23 2:14:38' and '9961-7-23 18:35:26'").Check(testkit.Rows())
	require.Nil(t, h.LoadNeededHistograms(dom.InfoSchema()))
	// Must execute successfully after loading the column stats.
	tk.MustQuery("select * from t where col between '8499-1-23 2:14:38' and '9961-7-23 18:35:26'").Check(testkit.Rows())
}

func TestSmallRangeEstimation(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, index idx(a))")
	for i := range 400 {
		testKit.MustExec(fmt.Sprintf("insert into t values (%v), (%v), (%v)", i, i, i)) // [0, 400)
	}
	testKit.MustExec("analyze table t with 0 topn")

	h := dom.StatsHandle()
	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := h.GetTableStats(table.Meta())
	sctx := mock.NewContext()
	col := statsTbl.GetCol(table.Meta().Columns[0].ID)

	var input []struct {
		Start int64
		End   int64
	}
	var output []struct {
		Start int64
		End   int64
		Count float64
	}
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i, ran := range input {
		count, err := cardinality.GetColumnRowCount(sctx, col, getRange(ran.Start, ran.End), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
		require.NoError(t, err)
		testdata.OnRecord(func() {
			output[i].Start = ran.Start
			output[i].End = ran.End
			output[i].Count = count
		})
		require.Truef(t, math.Abs(count-output[i].Count) < eps, "for [%v, %v], needed: around %v, got: %v", ran.Start, ran.End, output[i].Count, count)
	}
}

const eps = 1e-9

// generateIntDatum will generate a datum slice, every dimension is begin from 0, end with num - 1.
// If dimension is x, num is y, the total number of datum is y^x. And This slice is sorted.
func generateIntDatum(dimension, num int) ([]types.Datum, error) {
	length := int(math.Pow(float64(num), float64(dimension)))
	ret := make([]types.Datum, length)
	if dimension == 1 {
		for i := range num {
			ret[i] = types.NewIntDatum(int64(i))
		}
	} else {
		sc := stmtctx.NewStmtCtxWithTimeZone(time.Local)
		// In this way, we can guarantee the datum is in order.
		for i := range length {
			data := make([]types.Datum, dimension)
			j := i
			for k := range dimension {
				data[dimension-k-1].SetInt64(int64(j % num))
				j = j / num
			}
			bytes, err := codec.EncodeKey(sc.TimeZone(), nil, data...)
			if err != nil {
				return nil, err
			}
			ret[i].SetBytes(bytes)
		}
	}
	return ret, nil
}

// mockStatsHistogram will create a statistics.Histogram, of which the data is uniform distribution.
func mockStatsHistogram(id int64, values []types.Datum, repeat int64, tp *types.FieldType) *statistics.Histogram {
	ndv := len(values)
	histogram := statistics.NewHistogram(id, int64(ndv), 0, 0, tp, ndv, 0)
	for i := range ndv {
		histogram.AppendBucket(&values[i], &values[i], repeat*int64(i+1), repeat)
	}
	return histogram
}

func mockStatsTable(tbl *model.TableInfo, rowCount int64) *statistics.Table {
	histColl := *statistics.NewHistColl(tbl.ID, rowCount, 0, 0, 0)
	statsTbl := &statistics.Table{
		HistColl: histColl,
	}
	return statsTbl
}

func prepareSelectivity(testKit *testkit.TestKit, dom *domain.Domain) (*statistics.Table, error) {
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int primary key, b int, c int, d int, e int, index idx_cd(c, d), index idx_de(d, e))")

	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	if err != nil {
		return nil, err
	}
	tbl := tb.Meta()

	// mock the statistic table
	statsTbl := mockStatsTable(tbl, 540)

	// Set the value of columns' histogram.
	colValues, err := generateIntDatum(1, 54)
	if err != nil {
		return nil, err
	}
	for i := 1; i <= 5; i++ {
		statsTbl.SetCol(int64(i), &statistics.Column{
			Histogram:         *mockStatsHistogram(int64(i), colValues, 10, types.NewFieldType(mysql.TypeLonglong)),
			Info:              tbl.Columns[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
		})
	}

	// Set the value of two indices' histograms.
	idxValues, err := generateIntDatum(2, 3)
	if err != nil {
		return nil, err
	}
	tp := types.NewFieldType(mysql.TypeBlob)
	statsTbl.SetIdx(1, &statistics.Index{Histogram: *mockStatsHistogram(1, idxValues, 60, tp), Info: tbl.Indices[0]})
	statsTbl.SetIdx(2, &statistics.Index{Histogram: *mockStatsHistogram(2, idxValues, 60, tp), Info: tbl.Indices[1]})
	return statsTbl, nil
}

func getRange(start, end int64) ranger.Ranges {
	ran := &ranger.Range{
		LowVal:    []types.Datum{types.NewIntDatum(start)},
		HighVal:   []types.Datum{types.NewIntDatum(end)},
		Collators: collate.GetBinaryCollatorSlice(1),
	}
	return []*ranger.Range{ran}
}

func getRanges(start, end []int64) (res ranger.Ranges) {
	if len(start) != len(end) {
		return nil
	}
	for i := range start {
		ran := &ranger.Range{
			LowVal:    []types.Datum{types.NewIntDatum(start[i])},
			HighVal:   []types.Datum{types.NewIntDatum(end[i])},
			Collators: collate.GetBinaryCollatorSlice(1),
		}
		res = append(res, ran)
	}
	return
}

func TestSelectivityGreedyAlgo(t *testing.T) {
	nodes := make([]*cardinality.StatsNode, 3)
	nodes[0] = cardinality.MockStatsNode(1, 3, 2)
	nodes[1] = cardinality.MockStatsNode(2, 5, 2)
	nodes[2] = cardinality.MockStatsNode(3, 9, 2)

	// Sets should not overlap on mask, so only nodes[0] is chosen.
	usedSets := cardinality.GetUsableSetsByGreedy(nodes)
	require.Equal(t, 1, len(usedSets))
	require.Equal(t, int64(1), usedSets[0].ID)

	nodes[0], nodes[1] = nodes[1], nodes[0]
	// Sets chosen should be stable, so the returned node is still the one with ID 1.
	usedSets = cardinality.GetUsableSetsByGreedy(nodes)
	require.Equal(t, 1, len(usedSets))
	require.Equal(t, int64(1), usedSets[0].ID)
}

func TestTopNAssistedEstimationWithoutNewCollation(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	collate.SetNewCollationEnabledForTest(false)
	var (
		input  []string
		output []outputType
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	testTopNAssistedEstimationInner(t, input, output, store, dom)
}

func TestTopNAssistedEstimationWithNewCollation(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	collate.SetNewCollationEnabledForTest(true)
	var (
		input  []string
		output []outputType
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	testTopNAssistedEstimationInner(t, input, output, store, dom)
}

func testTopNAssistedEstimationInner(t *testing.T, input []string, output []outputType, store kv.Storage, dom *domain.Domain) {
	h := dom.StatsHandle()
	h.Clear()
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t")
	tk.MustExec("set @@tidb_default_string_match_selectivity = 0")
	tk.MustExec("set @@tidb_stats_load_sync_wait = 3000")
	tk.MustExec("create table t(" +
		"a varchar(100) charset utf8mb4 collate utf8mb4_bin," +
		"b varchar(100) charset utf8mb4 collate utf8mb4_general_ci," +
		"c varchar(100) charset utf8mb4 collate utf8mb4_general_ci," +
		"d varchar(100) charset gbk collate gbk_bin," +
		"e varchar(100) charset gbk collate gbk_chinese_ci," +
		"f varbinary(100))")
	// data distribution:
	// "111abc111", "111cba111", "111234111": 10 rows for each value
	// null: 3 rows
	// "tttttt", "uuuuuu", "vvvvvv", "wwwwww", "xxxxxx", "yyyyyy", "zzzzzz": 1 rows for each value
	// total: 40 rows
	for range 10 {
		tk.MustExec(`insert into t value("111abc111", "111abc111", "111abc111", "111abc111", "111abc111", "111abc111")`)
		tk.MustExec(`insert into t value("111cba111", "111cba111", "111cba111", "111cba111", "111cba111", "111cba111")`)
		tk.MustExec(`insert into t value("111234111", "111234111", "111234111", "111234111", "111234111", "111234111")`)
	}
	for range 3 {
		tk.MustExec(`insert into t value(null, null, null, null, null, null)`)
	}
	tk.MustExec(`insert into t value("tttttt", "tttttt", "tttttt", "tttttt", "tttttt", "tttttt")`)
	tk.MustExec(`insert into t value("uuuuuu", "uuuuuu", "uuuuuu", "uuuuuu", "uuuuuu", "uuuuuu")`)
	tk.MustExec(`insert into t value("vvvvvv", "vvvvvv", "vvvvvv", "vvvvvv", "vvvvvv", "vvvvvv")`)
	tk.MustExec(`insert into t value("wwwwww", "wwwwww", "wwwwww", "wwwwww", "wwwwww", "wwwwww")`)
	tk.MustExec(`insert into t value("xxxxxx", "xxxxxx", "xxxxxx", "xxxxxx", "xxxxxx", "xxxxxx")`)
	tk.MustExec(`insert into t value("yyyyyy", "yyyyyy", "yyyyyy", "yyyyyy", "yyyyyy", "yyyyyy")`)
	tk.MustExec(`insert into t value("zzzzzz", "zzzzzz", "zzzzzz", "zzzzzz", "zzzzzz", "zzzzzz")`)
	require.NoError(t, h.DumpStatsDeltaToKV(true))
	tk.MustExec(`analyze table t all columns with 3 topn`)

	for i, tt := range input {
		testdata.OnRecord(func() {
			output[i].SQL = tt
			output[i].Result = testdata.ConvertRowsToStrings(tk.MustQuery(tt).Rows())
		})
		tk.MustQuery(tt).Check(testkit.Rows(output[i].Result...))
	}
}

type outputType struct {
	SQL    string
	Result []string
}

func TestGlobalStatsOutOfRangeEstimationAfterDelete(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()
	testKit.MustExec("use test")
	testKit.MustExec("set @@tidb_partition_prune_mode='dynamic'")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int unsigned) " +
		"partition by range (a) " +
		"(partition p0 values less than (400), " +
		"partition p1 values less than (600), " +
		"partition p2 values less than (800)," +
		"partition p3 values less than (1000)," +
		"partition p4 values less than (1200))")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	for i := range 3000 {
		testKit.MustExec(fmt.Sprintf("insert into t values (%v)", i/5+300)) // [300, 900)
	}
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	testKit.MustExec("analyze table t all columns with 1 samplerate, 0 topn")
	testKit.MustExec("delete from t where a < 500")
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))
	var (
		input  []string
		output []struct {
			SQL    string
			Result []string
		}
	)
	statsSuiteData := cardinality.GetCardinalitySuiteData()
	statsSuiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i].SQL = input[i]
			output[i].Result = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
	}
	testKit.MustExec("analyze table t partition p4 all columns with 1 samplerate, 0 topn")
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))
	for i := range input {
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
	}
}

func generateMapsForMockStatsTbl(statsTbl *statistics.Table) {
	idx2Columns := make(map[int64][]int64)
	colID2IdxIDs := make(map[int64][]int64)
	statsTbl.ForEachIndexImmutable(func(_ int64, idxHist *statistics.Index) bool {
		ids := make([]int64, 0, len(idxHist.Info.Columns))
		for _, idxCol := range idxHist.Info.Columns {
			ids = append(ids, int64(idxCol.Offset))
		}
		colID2IdxIDs[ids[0]] = append(colID2IdxIDs[ids[0]], idxHist.ID)
		idx2Columns[idxHist.ID] = ids
		return false
	})
	for _, idxIDs := range colID2IdxIDs {
		slices.Sort(idxIDs)
	}
	statsTbl.Idx2ColUniqueIDs = idx2Columns
	statsTbl.ColUniqueID2IdxIDs = colID2IdxIDs
}

func TestIssue39593(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, index idx(a, b))")
	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()

	// mock the statistics.Table
	statsTbl := mockStatsTable(tblInfo, 540)
	colValues, err := generateIntDatum(1, 54)
	require.NoError(t, err)
	for i := 1; i <= 2; i++ {
		statsTbl.SetCol(int64(i), &statistics.Column{
			Histogram:         *mockStatsHistogram(int64(i), colValues, 10, types.NewFieldType(mysql.TypeLonglong)),
			Info:              tblInfo.Columns[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
			StatsVer:          2,
		})
	}
	idxValues, err := generateIntDatum(2, 3)
	require.NoError(t, err)
	tp := types.NewFieldType(mysql.TypeBlob)
	statsTbl.SetIdx(1, &statistics.Index{
		Histogram: *mockStatsHistogram(1, idxValues, 60, tp),
		Info:      tblInfo.Indices[0],
		StatsVer:  2,
	})
	generateMapsForMockStatsTbl(statsTbl)

	sctx := testKit.Session()
	idxID := tblInfo.Indices[0].ID
	vals := []int64{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}
	count, _, err := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRanges(vals, vals))
	require.NoError(t, err)
	// estimated row count without any changes, use range to reduce test flakiness
	require.InDelta(t, float64(462.6), count, float64(1))
	statsTbl.RealtimeCount *= 10
	count, _, err = cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRanges(vals, vals))
	require.NoError(t, err)
	// estimated row count after mock modify on the table, use range to reduce test flakiness
	require.InDelta(t, float64(3702.6), count, float64(1))
}

func TestIndexJoinInnerRowCountUpperBound(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, index idx(b))")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()

	// Mock the stats:
	// The two columns are the same.
	// From 0 to 499, each value has 1000 rows. Therefore, NDV is 500 and total row count is 500000.
	mockStatsTbl := mockStatsTable(tblInfo, 500000)
	colValues, err := generateIntDatum(1, 500)
	require.NoError(t, err)
	for i := 1; i <= 2; i++ {
		mockStatsTbl.SetCol(int64(i), &statistics.Column{
			Histogram:         *mockStatsHistogram(int64(i), colValues, 1000, types.NewFieldType(mysql.TypeLonglong)),
			Info:              tblInfo.Columns[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
			StatsVer:          2,
		})
	}
	idxValues := make([]types.Datum, 0, len(colValues))
	sc := stmtctx.NewStmtCtxWithTimeZone(time.UTC)
	for _, colV := range colValues {
		b, err := codec.EncodeKey(sc.TimeZone(), nil, colV)
		require.NoError(t, err)
		idxValues = append(idxValues, types.NewBytesDatum(b))
	}
	mockStatsTbl.SetIdx(1, &statistics.Index{
		Histogram:         *mockStatsHistogram(1, idxValues, 1000, types.NewFieldType(mysql.TypeBlob)),
		Info:              tblInfo.Indices[0],
		StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
		StatsVer:          2,
	})
	generateMapsForMockStatsTbl(mockStatsTbl)
	stat := h.GetTableStats(tblInfo)
	stat.HistColl = mockStatsTbl.HistColl

	var (
		input  []string
		output []struct {
			Query  string
			Result []string
		}
	)

	suiteData := cardinality.GetCardinalitySuiteData()
	suiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i].Query = input[i]
		})
		if !strings.HasPrefix(input[i], "explain") {
			testKit.MustExec(input[i])
			continue
		}
		testdata.OnRecord(func() {
			output[i].Result = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
	}
}

func TestOrderingIdxSelectivityThreshold(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()
	sc := stmtctx.NewStmtCtxWithTimeZone(time.UTC)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int primary key , b int, c int, d int, index ib(b), index ic(c))")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()

	// Mock the stats:
	// total row count 100000
	// column a: PK, from 0 to 100000, NDV 100000
	// column b, c, d: from 0 to 10000, each value has 10 rows, NDV 10000
	// indexes are created on (b), (c) respectively
	mockStatsTbl := mockStatsTable(tblInfo, 100000)
	pkColValues, err := generateIntDatum(1, 100000)
	require.NoError(t, err)
	mockStatsTbl.SetCol(1, &statistics.Column{
		Histogram:         *mockStatsHistogram(1, pkColValues, 1, types.NewFieldType(mysql.TypeLonglong)),
		Info:              tblInfo.Columns[0],
		StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
		StatsVer:          2,
	})
	colValues, err := generateIntDatum(1, 10000)
	require.NoError(t, err)
	idxValues := make([]types.Datum, 0)
	for _, val := range colValues {
		b, err := codec.EncodeKey(sc.TimeZone(), nil, val)
		require.NoError(t, err)
		idxValues = append(idxValues, types.NewBytesDatum(b))
	}

	for i := 2; i <= 4; i++ {
		mockStatsTbl.SetCol(int64(i), &statistics.Column{
			Histogram:         *mockStatsHistogram(int64(i), colValues, 10, types.NewFieldType(mysql.TypeLonglong)),
			Info:              tblInfo.Columns[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
			StatsVer:          2,
		})
	}
	for i := 1; i <= 2; i++ {
		mockStatsTbl.SetIdx(int64(i), &statistics.Index{
			Histogram:         *mockStatsHistogram(int64(i), idxValues, 10, types.NewFieldType(mysql.TypeBlob)),
			Info:              tblInfo.Indices[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
			StatsVer:          2,
		})
	}
	generateMapsForMockStatsTbl(mockStatsTbl)
	stat := h.GetTableStats(tblInfo)
	stat.HistColl = mockStatsTbl.HistColl

	var (
		input  []string
		output []struct {
			Query  string
			Result []string
		}
	)

	integrationSuiteData := cardinality.GetCardinalitySuiteData()
	integrationSuiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i].Query = input[i]
		})
		if !strings.HasPrefix(input[i], "explain") {
			testKit.MustExec(input[i])
			continue
		}
		testdata.OnRecord(func() {
			output[i].Result = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
	}
}

func TestOrderingIdxSelectivityRatio(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()
	sc := stmtctx.NewStmtCtxWithTimeZone(time.UTC)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int primary key, b int, c int, index ib(b), index ic(c))")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()

	// Mock the stats:
	// total row count 1000
	// column b, c: from 1 to 1000, NDV 1000
	// indexes are created on (b), (c) respectively
	mockStatsTbl := mockStatsTable(tblInfo, 1000)
	pkColValues, err := generateIntDatum(1, 1000)
	require.NoError(t, err)
	mockStatsTbl.SetCol(1, &statistics.Column{
		Histogram:         *mockStatsHistogram(1, pkColValues, 1, types.NewFieldType(mysql.TypeLonglong)),
		Info:              tblInfo.Columns[0],
		StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
		StatsVer:          2,
	})
	colValues, err := generateIntDatum(1, 1000)
	require.NoError(t, err)
	idxValues := make([]types.Datum, 0)
	for _, val := range colValues {
		b, err := codec.EncodeKey(sc.TimeZone(), nil, val)
		require.NoError(t, err)
		idxValues = append(idxValues, types.NewBytesDatum(b))
	}

	for i := 2; i <= 3; i++ {
		mockStatsTbl.SetCol(int64(i), &statistics.Column{
			Histogram:         *mockStatsHistogram(int64(i), colValues, 1, types.NewFieldType(mysql.TypeLonglong)),
			Info:              tblInfo.Columns[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
			StatsVer:          2,
		})
	}
	for i := 1; i <= 2; i++ {
		mockStatsTbl.SetIdx(int64(i), &statistics.Index{
			Histogram:         *mockStatsHistogram(int64(i), idxValues, 1, types.NewFieldType(mysql.TypeBlob)),
			Info:              tblInfo.Indices[i-1],
			StatsLoadedStatus: statistics.NewStatsFullLoadStatus(),
			StatsVer:          2,
		})
	}
	generateMapsForMockStatsTbl(mockStatsTbl)
	stat := h.GetTableStats(tblInfo)
	stat.HistColl = mockStatsTbl.HistColl

	var (
		input  []string
		output []struct {
			Query  string
			Result []string
		}
	)

	integrationSuiteData := cardinality.GetCardinalitySuiteData()
	integrationSuiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i].Query = input[i]
		})
		if !strings.HasPrefix(input[i], "explain") {
			testKit.MustExec(input[i])
			continue
		}
		testdata.OnRecord(func() {
			output[i].Result = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
	}
}

func TestOrderingIdxSelectivityRatioForJoin(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int, index ibc(b, c))")
	testKit.MustExec("insert into t values (1,1,1), (2,2,2), (3,3,3), (4,4,4), (5,5,5), (6,6,6), (7,7,7), (8,8,8), (9,9,9), (10,10,10)")
	testKit.MustExec("insert into t select a,b,c from t")
	testKit.MustExec("analyze table t")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))

	// Discourage merge join and hash join to encourage index join, and discourage topn to encourage limit.
	testKit.MustExec("set @@session.tidb_opt_merge_join_cost_factor = 1000")
	testKit.MustExec("set @@session.tidb_opt_hash_join_cost_factor = 1000")
	testKit.MustExec("set @@session.tidb_opt_topn_cost_factor = 1000")
	// Disable idx_selectivity_ratio using -1 and 0 - both should have no effect.
	testKit.MustExec("set @@session.tidb_opt_ordering_index_selectivity_ratio = -1")
	rs := testKit.MustQuery("explain format=verbose select t1.* from t t1 use index (ibc) join t t2 on t1.b=t2.b where t2.c=5 order by t1.b limit 2").Rows()
	planCost1, err1 := strconv.ParseFloat(rs[0][2].(string), 64)
	require.Nil(t, err1)
	testKit.MustExec("set @@session.tidb_opt_ordering_index_selectivity_ratio = 0")
	rs = testKit.MustQuery("explain format=verbose select t1.* from t t1 use index (ibc) join t t2 on t1.b=t2.b where t2.c=5 order by t1.b limit 2").Rows()
	planCost2, err2 := strconv.ParseFloat(rs[0][2].(string), 64)
	require.Nil(t, err2)
	require.Equal(t, planCost1, planCost2)
	// Increasing the ratio should increase the cost of index join, so the plan cost should increase.
	testKit.MustExec("set @@session.tidb_opt_ordering_index_selectivity_ratio = 0.5")
	rs = testKit.MustQuery("explain format=verbose select t1.* from t t1 use index (ibc) join t t2 on t1.b=t2.b where t2.c=5 order by t1.b limit 2").Rows()
	planCost3, err3 := strconv.ParseFloat(rs[0][2].(string), 64)
	require.Nil(t, err3)
	require.Less(t, planCost2, planCost3)
	testKit.MustExec("set @@session.tidb_opt_ordering_index_selectivity_ratio = 1")
	rs = testKit.MustQuery("explain format=verbose select t1.* from t t1 use index (ibc) join t t2 on t1.b=t2.b where t2.c=5 order by t1.b limit 2").Rows()
	planCost4, err4 := strconv.ParseFloat(rs[0][2].(string), 64)
	require.Nil(t, err4)
	require.Less(t, planCost3, planCost4)
}
func TestCrossValidationSelectivity(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t")
	tk.MustExec("set @@tidb_analyze_version = 1")
	tk.MustExec("create table t (a int, b int, c int, primary key (a, b) clustered)")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	tk.MustExec("insert into t values (1,2,3), (1,4,5)")
	require.NoError(t, h.DumpStatsDeltaToKV(true))
	tk.MustExec("analyze table t")
	tk.MustQuery("explain format = 'brief' select * from t where a = 1 and b > 0 and b < 1000 and c > 1000").Check(testkit.Rows(
		"TableReader 1.00 root  data:Selection",
		"└─Selection 1.00 cop[tikv]  gt(test.t.c, 1000)",
		"  └─TableRangeScan 2.00 cop[tikv] table:t range:(1 0,1 1000), keep order:false"))
}

func TestIgnoreRealtimeStats(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int)")
	h := dom.StatsHandle()
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)

	// 1. Insert 11 rows of data without ANALYZE.
	testKit.MustExec("insert into t values(1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1)")
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))

	// 1-1. use real-time stats.
	// From the real-time stats, we are able to know the total count is 11.
	testKit.MustExec("set @@tidb_opt_objective = 'moderate'")
	testKit.MustQuery("explain select * from t where a = 1 and b > 2").Check(testkit.Rows(
		"TableReader_8 1.00 root  data:Selection_7",
		"└─Selection_7 1.00 cop[tikv]  eq(test.t.a, 1), gt(test.t.b, 2)",
		"  └─TableFullScan_6 11.00 cop[tikv] table:t keep order:false, stats:pseudo",
	))

	// 1-2. ignore real-time stats.
	// Use pseudo stats table. The total row count is 10000.
	testKit.MustExec("set @@tidb_opt_objective = 'determinate'")
	testKit.MustQuery("explain select * from t where a = 1 and b > 2").Check(testkit.Rows(
		"TableReader_8 3.33 root  data:Selection_7",
		"└─Selection_7 3.33 cop[tikv]  eq(test.t.a, 1), gt(test.t.b, 2)",
		"  └─TableFullScan_6 10000.00 cop[tikv] table:t keep order:false, stats:pseudo",
	))

	// 2. After ANALYZE.
	testKit.MustExec("analyze table t all columns with 1 samplerate")
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))

	// The execution plans are the same no matter we ignore the real-time stats or not.
	analyzedPlan := []string{
		"TableReader_8 2.73 root  data:Selection_7",
		"└─Selection_7 2.73 cop[tikv]  eq(test.t.a, 1), gt(test.t.b, 2)",
		"  └─TableFullScan_6 11.00 cop[tikv] table:t keep order:false",
	}
	testKit.MustExec("set @@tidb_opt_objective = 'moderate'")
	testKit.MustQuery("explain select * from t where a = 1 and b > 2").Check(testkit.Rows(analyzedPlan...))
	testKit.MustExec("set @@tidb_opt_objective = 'determinate'")
	testKit.MustQuery("explain select * from t where a = 1 and b > 2").Check(testkit.Rows(analyzedPlan...))

	// 3. Insert another 4 rows of data.
	testKit.MustExec("insert into t values(3,2),(3,3),(3,4),(3,5)")
	require.Nil(t, h.DumpStatsDeltaToKV(true))
	require.Nil(t, h.Update(context.Background(), dom.InfoSchema()))

	// 3-1. use real-time stats.
	// From the real-time stats, we are able to know the total count is 15.
	// Selectivity is not changed: 15 * (2.73 / 11) = 3.72
	testKit.MustExec("set @@tidb_opt_objective = 'moderate'")
	testKit.MustQuery("explain select * from t where a = 1 and b > 2").Check(testkit.Rows(
		"TableReader_8 3.72 root  data:Selection_7",
		"└─Selection_7 3.72 cop[tikv]  eq(test.t.a, 1), gt(test.t.b, 2)",
		"  └─TableFullScan_6 15.00 cop[tikv] table:t keep order:false",
	))

	// 3-2. ignore real-time stats.
	// The execution plan is the same as case 2.
	testKit.MustExec("set @@tidb_opt_objective = 'determinate'")
	testKit.MustQuery("explain select * from t where a = 1 and b > 2").Check(testkit.Rows(analyzedPlan...))
}

func TestSubsetIdxCardinality(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, b int, c int, index iabc(a, b, c))")
	// Insert enough rows with differing cardinalities to test subset vs full index cardinality estimate.
	// Result of a 2 column match should produce more rows than 3 column match.
	testKit.MustExec("insert into t values (1, 1, 1), (1, 1, 1), (2, 1, 1), (2, 1, 1), (3, 1, 1), (3, 1, 1), (4, 1, 1), (4, 1, 1), (5, 1, 1), (5, 1, 1)")
	testKit.MustExec("insert into t select a + 5, a, a from t")
	for i := 1; i < 3; i++ {
		testKit.MustExec(fmt.Sprintf("insert into t select a + 10 + %v, b + 1, c from t", i))
	}
	for range 3 {
		testKit.MustExec("insert into t select a, b, c from t")
	}
	testKit.MustExec("insert into t select a, b + 10, c from t")
	require.NoError(t, h.DumpStatsDeltaToKV(true))
	testKit.MustExec(`analyze table t`)

	var (
		input  []string
		output []struct {
			Query  string
			Result []string
		}
	)
	integrationSuiteData := cardinality.GetCardinalitySuiteData()
	integrationSuiteData.LoadTestCases(t, &input, &output)
	for i := range input {
		testdata.OnRecord(func() {
			output[i].Query = input[i]
		})
		if !strings.HasPrefix(input[i], "explain") {
			testKit.MustExec(input[i])
			continue
		}
		testdata.OnRecord(func() {
			output[i].Result = testdata.ConvertRowsToStrings(testKit.MustQuery(input[i]).Rows())
		})
		testKit.MustQuery(input[i]).Check(testkit.Rows(output[i].Result...))
	}
}

func TestBuiltinInEstWithoutStats(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	h := dom.StatsHandle()

	tk.MustExec("use test")
	tk.MustExec("create table t(a int, b int)")
	err := statstestutil.HandleNextDDLEventWithTxn(h)
	require.NoError(t, err)
	tk.MustExec("insert into t values(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10)")
	require.NoError(t, h.DumpStatsDeltaToKV(true))
	is := dom.InfoSchema()
	require.NoError(t, h.Update(context.Background(), is))
	expectedA := testkit.Rows(
		"TableReader 1.00 root  data:Selection",
		"└─Selection 1.00 cop[tikv]  in(test.t.a, 1, 2, 3, 4, 5, 6, 7, 8)",
		"  └─TableFullScan 10.00 cop[tikv] table:t keep order:false, stats:pseudo",
	)
	expectedB := testkit.Rows(
		"TableReader 1.00 root  data:Selection",
		"└─Selection 1.00 cop[tikv]  in(test.t.b, 1, 2, 3, 4, 5, 6, 7, 8)",
		"  └─TableFullScan 10.00 cop[tikv] table:t keep order:false, stats:pseudo",
	)
	tk.MustQuery("explain format='brief' select * from t where a in (1, 2, 3, 4, 5, 6, 7, 8)").Check(expectedA)
	// try again with other column
	tk.MustQuery("explain format='brief' select * from t where b in (1, 2, 3, 4, 5, 6, 7, 8)").Check(expectedB)

	h.Clear()
	require.NoError(t, h.InitStatsLite(context.Background()))
	tk.MustQuery("explain format='brief' select * from t where a in (1, 2, 3, 4, 5, 6, 7, 8)").Check(expectedA)
	tk.MustQuery("explain format='brief' select * from t where b in (1, 2, 3, 4, 5, 6, 7, 8)").Check(expectedB)

	h.Clear()
	require.NoError(t, h.InitStats(context.Background(), is))
	tk.MustQuery("explain format='brief' select * from t where a in (1, 2, 3, 4, 5, 6, 7, 8)").Check(expectedA)
	tk.MustQuery("explain format='brief' select * from t where b in (1, 2, 3, 4, 5, 6, 7, 8)").Check(expectedB)
	require.NoError(t, h.Update(context.Background(), is))
	tbl, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl, found := h.Get(tbl.Meta().ID)
	require.True(t, found)
	require.False(t, statsTbl.ColAndIdxExistenceMap.IsEmpty())
	for _, col := range tbl.Cols() {
		require.False(t, statsTbl.ColAndIdxExistenceMap.HasAnalyzed(col.ID, false))
	}
}

func TestRiskEqSkewRatio(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, index idx(a))")
	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()

	// Insert enough rows to produce a single skewed value.
	testKit.MustExec("insert into t values (1), (1), (1), (1), (2), (2), (3), (4), (5)")
	// Do not collect topn to ensure that test will not find value in topn.
	testKit.MustExec(`analyze table t with 0 topn`)
	h := dom.StatsHandle()
	require.NoError(t, h.DumpStatsDeltaToKV(true))

	sctx := testKit.Session()
	idxID := tblInfo.Indices[0].ID
	statsTbl := h.GetTableStats(tb.Meta())
	// Search for the value "6" which will not be found in the histogram buckets, and since
	// there are NO topN values - the value will be considered skewed based upon skew ratio.
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = 0")
	count, _, err := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err)
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = 0.5")
	count2, _, err2 := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err2)
	// Result of count2 should be larger than count because the risk ratio is higher
	require.Less(t, count, count2)
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = 1")
	count3, _, err3 := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err3)
	// Result of count3 should be larger because the risk ratio is higher
	require.Less(t, count2, count3)
	// reset skew ratio to 0
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = 0")
	// Collect 1 topn to ensure that test will not find value in topn.
	// With 1 value in topN - value 6 will only be considered skewed within the remaining values.
	testKit.MustExec(`analyze table t with 1 topn`)
	require.NoError(t, h.DumpStatsDeltaToKV(true))
	// Rerun tests with 1 value in the TopN
	statsTbl = h.GetTableStats(tb.Meta())
	count, _, err = cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err)
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = 0.5")
	count2, _, err2 = cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err2)
	// Result of count2 should be larger than count because the risk ratio is higher
	require.Less(t, count, count2)
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = 1")
	count3, _, err3 = cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err3)
	// Result of count3 should be larger than count because the risk ratio is higher
	require.Less(t, count2, count3)
	// Repeat the prior test by setting the global variable instead of the session variable. This should have no effect.
	testKit.MustExec("set @@global.tidb_opt_risk_eq_skew_ratio = 0.5")
	count4, _, err4 := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err4)
	require.Less(t, count2, count4)
	// Repeat the prior test by setting the session variable to the default. Count4 should inherit the global
	// variable and be less than count3.
	testKit.MustExec("set @@session.tidb_opt_risk_eq_skew_ratio = default")
	count4, _, err4 = cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(6, 6))
	require.NoError(t, err4)
	require.Less(t, count4, count3)
	// Reset global variable to default.
	testKit.MustExec("set @@global.tidb_opt_risk_eq_skew_ratio = default")
}

func TestRiskRangeSkewRatioWithinBucket(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)

	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, index idx(a))")
	is := dom.InfoSchema()
	tb, err := is.TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	tblInfo := tb.Meta()

	// Insert enough rows to produce skewed distribution.
	testKit.MustExec("insert into t values (1), (1), (1), (1), (2), (2), (3), (4), (5), (5)")
	// Do not collect topn and only collect 1 bucket to ensure later queries will be within a bucket.
	testKit.MustExec(`analyze table t with 0 topn, 1 buckets`)
	h := dom.StatsHandle()
	require.NoError(t, h.DumpStatsDeltaToKV(true))

	sctx := testKit.Session()
	idxID := tblInfo.Indices[0].ID
	statsTbl := h.GetTableStats(tb.Meta())
	// Search for the range from 2 to 3, since there is only one bucket it will be a query within
	// a bucket.
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 0")
	count, _, err := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(2, 3))
	require.NoError(t, err)
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 0.5")
	count2, _, err2 := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(2, 3))
	require.NoError(t, err2)
	// Result of count2 should be larger than count because the risk ratio is higher
	require.Less(t, count, count2)
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 1")
	count3, _, err3 := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(2, 3))
	require.NoError(t, err3)
	// Result of count3 should be larger because the risk ratio is higher
	require.Less(t, count2, count3)
	// Repeat the prior test by setting the global variable instead of the session variable. This should have no effect.
	testKit.MustExec("set @@global.tidb_opt_risk_range_skew_ratio = 0.5")
	count4, _, err4 := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(2, 3))
	require.NoError(t, err4)
	require.Less(t, count2, count4)
	// Repeat the prior test by setting the session variable to the default. Count4 should inherit the global
	// variable and be less than count3.
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = default")
	count4, _, err4 = cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, idxID, getRange(2, 3))
	require.NoError(t, err4)
	require.Less(t, count4, count3)
	// Reset global variable to default.
	testKit.MustExec("set @@global.tidb_opt_risk_range_skew_ratio = default")
}

func TestRiskRangeSkewRatioOutOfRange(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, key idx(a))")
	testKit.MustExec("set @@tidb_analyze_version=2")
	testKit.MustExec("set @@global.tidb_enable_auto_analyze='OFF'")
	for i := 1; i <= 10; i++ {
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		testKit.MustExec(fmt.Sprintf("insert into t select a from t where a = %d", i))
	}
	//Ensure that there are values in the histogram buckets
	testKit.MustExec("analyze table t with 0 topn")
	h := dom.StatsHandle()
	require.Nil(t, h.DumpStatsDeltaToKV(true))

	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := h.GetTableStats(table.Meta())
	sctx := testKit.Session()
	col := statsTbl.GetCol(table.Meta().Columns[0].ID)

	// Increase RealTimeCount and ModifyCount to simulate changes to dataset
	RealTimeCount := statsTbl.RealtimeCount * 10
	ModifyCount := RealTimeCount * 2

	// Search for range outside of histogram buckets
	test, _ := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(12, 15), int64(0), int64(0), false)
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 0")
	count, err := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(12, 15), RealTimeCount, ModifyCount, false)
	require.NoError(t, err)
	require.Less(t, test, count)
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 0.5")
	count2, err2 := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(12, 15), RealTimeCount, ModifyCount, false)
	require.NoError(t, err2)
	// Result of count2 should be larger than count because the risk ratio is higher
	require.Less(t, count, count2)
	testKit.MustExec("set @@session.tidb_opt_risk_range_skew_ratio = 1")
	count3, err3 := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(12, 15), RealTimeCount, ModifyCount, false)
	require.NoError(t, err3)
	// Result of count3 should be larger because the risk ratio is higher
	require.Less(t, count2, count3)
}

func TestLastBucketEndValueHeuristic(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	testKit := testkit.NewTestKit(t, store)
	testKit.MustExec("use test")
	testKit.MustExec("drop table if exists t")
	testKit.MustExec("create table t(a int, index idx(a))")
	testKit.MustExec("set @@tidb_analyze_version=2")
	testKit.MustExec("set @@global.tidb_enable_auto_analyze='OFF'")

	// Insert initial data with a clear distribution
	// Values 1-10 each appear 100 times (1000 rows)
	// Value 11 appears only once (to be in last bucket with low count)
	for i := 1; i <= 10; i++ {
		for j := 0; j < 100; j++ {
			testKit.MustExec(fmt.Sprintf("insert into t values (%d)", i))
		}
	}
	testKit.MustExec("insert into t values (11)")

	// Flush any pending deltas before ANALYZE
	h := dom.StatsHandle()
	require.NoError(t, h.DumpStatsDeltaToKV(true))
	require.NoError(t, h.Update(context.Background(), dom.InfoSchema()))

	testKit.MustExec("analyze table t with 5 buckets, 0 topn")

	table, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr("test"), ast.NewCIStr("t"))
	require.NoError(t, err)
	statsTbl := h.GetTableStats(table.Meta())
	sctx := testKit.Session()
	col := statsTbl.GetCol(table.Meta().Columns[0].ID)

	// Get baseline estimation for value 11 which should be 1
	baselineCount, err := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(11, 11), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)
	require.Equal(t, baselineCount, float64(1))

	// Test Case 1: Insufficient new rows (should NOT trigger heuristic)
	// avgBucketSize = 1001/10 = 100.1, threshold = 100.1 * 0.5 = 50.05
	// So 10 new rows should be insufficient
	for i := 0; i < 10; i++ {
		testKit.MustExec("insert into t values (11)")
	}

	require.NoError(t, h.DumpStatsDeltaToKV(true))
	require.NoError(t, h.Update(context.Background(), dom.InfoSchema()))

	statsTbl = h.GetTableStats(table.Meta())
	col = statsTbl.GetCol(table.Meta().Columns[0].ID)

	insufficientCount, err := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(11, 11), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)

	// Should be close to baseline since heuristic didn't trigger
	require.InDelta(t, baselineCount, insufficientCount, baselineCount*0.5,
		"Count should be similar when insufficient new rows are added")

	// Test Case 2: Sufficient new rows (should trigger heuristic)
	// Insert more rows to reach threshold (need 50+ total new rows)
	for i := 0; i < 90; i++ { // 10 + 90 = 100 total
		testKit.MustExec("insert into t values (11)")
	}

	require.NoError(t, h.DumpStatsDeltaToKV(true))
	require.NoError(t, h.Update(context.Background(), dom.InfoSchema()))

	statsTbl = h.GetTableStats(table.Meta())
	col = statsTbl.GetCol(table.Meta().Columns[0].ID)

	enhancedCount, err := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(11, 11), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)

	// Should be much higher due to heuristic
	require.InDelta(t, 100.09, enhancedCount, 0.1, "Enhanced count should be approximately 100.09")

	// Verify other end values don't trigger heuristic
	otherCount, err := cardinality.GetColumnRowCount(sctx.GetPlanCtx(), col, getRange(3, 3), statsTbl.RealtimeCount, statsTbl.ModifyCount, false)
	require.NoError(t, err)
	require.InDelta(t, 109.99, otherCount, 0.1, "Other value count should be approximately 109.99")

	// Test index estimation as well
	idx := statsTbl.GetIdx(table.Meta().Indices[0].ID)
	if idx != nil {
		idxEnhancedCount, _, err := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, table.Meta().Indices[0].ID, getRange(11, 11))
		require.NoError(t, err)
		require.InDelta(t, 100.09, idxEnhancedCount, 0.1, "Index enhanced count should be approximately 100.09")

		idxOtherCount, _, err := cardinality.GetRowCountByIndexRanges(sctx.GetPlanCtx(), &statsTbl.HistColl, table.Meta().Indices[0].ID, getRange(3, 3))
		require.NoError(t, err)
		require.InDelta(t, 109.99, idxOtherCount, 0.1, "Index other count should be approximately 109.99")
	}
}
