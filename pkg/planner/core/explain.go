// Copyright 2017 PingCAP, Inc.
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

package core

import (
	"bytes"
	"fmt"
	"strconv"
	"strings"

	perrors "github.com/pingcap/errors"
	"github.com/pingcap/tidb/pkg/expression"
	"github.com/pingcap/tidb/pkg/infoschema"
	"github.com/pingcap/tidb/pkg/kv"
	"github.com/pingcap/tidb/pkg/parser/mysql"
	"github.com/pingcap/tidb/pkg/planner/core/operator/physicalop"
	"github.com/pingcap/tidb/pkg/planner/property"
	"github.com/pingcap/tidb/pkg/sessionctx/vardef"
	"github.com/pingcap/tidb/pkg/statistics"
	"github.com/pingcap/tidb/pkg/types"
	"github.com/pingcap/tidb/pkg/util/plancodec"
	"github.com/pingcap/tidb/pkg/util/stringutil"
	"github.com/pingcap/tipb/go-tipb"
)

// ExplainInfo implements Plan interface.
func (p *PhysicalLock) ExplainInfo() string {
	var str strings.Builder
	str.WriteString(p.Lock.LockType.String())
	str.WriteString(" ")
	str.WriteString(strconv.FormatUint(p.Lock.WaitSec, 10))
	return str.String()
}

// ExplainID overrides the ExplainID in order to match different range.
func (p *PhysicalIndexScan) ExplainID(_ ...bool) fmt.Stringer {
	return stringutil.MemoizeStr(func() string {
		if p.SCtx() != nil && p.SCtx().GetSessionVars().StmtCtx.IgnoreExplainIDSuffix {
			return p.TP()
		}
		return p.TP() + "_" + strconv.Itoa(p.ID())
	})
}

// TP overrides the TP in order to match different range.
func (p *PhysicalIndexScan) TP(_ ...bool) string {
	if p.isFullScan() {
		return plancodec.TypeIndexFullScan
	}
	return plancodec.TypeIndexRangeScan
}

// ExplainInfo implements Plan interface.
func (p *PhysicalIndexScan) ExplainInfo() string {
	return p.AccessObject().String() + ", " + p.OperatorInfo(false)
}

// ExplainNormalizedInfo implements Plan interface.
func (p *PhysicalIndexScan) ExplainNormalizedInfo() string {
	return p.AccessObject().NormalizedString() + ", " + p.OperatorInfo(true)
}

// OperatorInfo implements DataAccesser interface.
func (p *PhysicalIndexScan) OperatorInfo(normalized bool) string {
	ectx := p.SCtx().GetExprCtx().GetEvalCtx()
	redact := p.SCtx().GetSessionVars().EnableRedactLog
	var buffer strings.Builder
	if len(p.rangeInfo) > 0 {
		if !normalized {
			buffer.WriteString("range: decided by ")
			buffer.WriteString(p.rangeInfo)
			buffer.WriteString(", ")
		}
	} else if p.haveCorCol() {
		if normalized {
			buffer.WriteString("range: decided by ")
			buffer.Write(expression.SortedExplainNormalizedExpressionList(p.AccessCondition))
			buffer.WriteString(", ")
		} else {
			buffer.WriteString("range: decided by [")
			for i, expr := range p.AccessCondition {
				if i != 0 {
					buffer.WriteString(" ")
				}
				buffer.WriteString(expr.StringWithCtx(ectx, redact))
			}
			buffer.WriteString("], ")
		}
	} else if len(p.Ranges) > 0 {
		if normalized {
			buffer.WriteString("range:[?,?], ")
		} else if !p.isFullScan() {
			buffer.WriteString("range:")
			for _, idxRange := range p.Ranges {
				buffer.WriteString(idxRange.Redact(redact))
				buffer.WriteString(", ")
			}
		}
	}
	buffer.WriteString("keep order:")
	buffer.WriteString(strconv.FormatBool(p.KeepOrder))
	if p.Desc {
		buffer.WriteString(", desc")
	}
	if !normalized {
		if p.usedStatsInfo != nil {
			str := p.usedStatsInfo.FormatForExplain()
			if len(str) > 0 {
				buffer.WriteString(", ")
				buffer.WriteString(str)
			}
		} else if p.StatsInfo().StatsVersion == statistics.PseudoVersion {
			// This branch is not needed in fact, we add this to prevent test result changes under planner/cascades/
			buffer.WriteString(", stats:pseudo")
		}
	}
	return buffer.String()
}

func (p *PhysicalIndexScan) haveCorCol() bool {
	for _, cond := range p.AccessCondition {
		if len(expression.ExtractCorColumns(cond)) > 0 {
			return true
		}
	}
	return false
}

func (p *PhysicalIndexScan) isFullScan() bool {
	if len(p.rangeInfo) > 0 || p.haveCorCol() {
		return false
	}
	for _, ran := range p.Ranges {
		if !ran.IsFullRange(false) {
			return false
		}
	}
	return true
}

// ExplainID overrides the ExplainID in order to match different range.
func (p *PhysicalTableScan) ExplainID(isChildOfIndexLookUp ...bool) fmt.Stringer {
	return stringutil.MemoizeStr(func() string {
		if p.SCtx() != nil && p.SCtx().GetSessionVars().StmtCtx.IgnoreExplainIDSuffix {
			return p.TP(isChildOfIndexLookUp...)
		}
		return p.TP(isChildOfIndexLookUp...) + "_" + strconv.Itoa(p.ID())
	})
}

// TP overrides the TP in order to match different range.
func (p *PhysicalTableScan) TP(isChildOfIndexLookUp ...bool) string {
	if infoschema.IsClusterTableByName(p.DBName.L, p.Table.Name.L) {
		return plancodec.TypeMemTableScan
	} else if len(isChildOfIndexLookUp) > 0 && isChildOfIndexLookUp[0] {
		return plancodec.TypeTableRowIDScan
	} else if p.isFullScan() {
		return plancodec.TypeTableFullScan
	}
	return plancodec.TypeTableRangeScan
}

// ExplainInfo implements Plan interface.
func (p *PhysicalTableScan) ExplainInfo() string {
	return p.AccessObject().String() + ", " + p.OperatorInfo(false)
}

// ExplainNormalizedInfo implements Plan interface.
func (p *PhysicalTableScan) ExplainNormalizedInfo() string {
	return p.AccessObject().NormalizedString() + ", " + p.OperatorInfo(true)
}

// OperatorInfo implements DataAccesser interface.
func (p *PhysicalTableScan) OperatorInfo(normalized bool) string {
	if infoschema.IsClusterTableByName(p.DBName.L, p.Table.Name.L) {
		return ""
	}

	ectx := p.SCtx().GetExprCtx().GetEvalCtx()
	redact := p.SCtx().GetSessionVars().EnableRedactLog
	var buffer strings.Builder
	if len(p.rangeInfo) > 0 {
		if !normalized {
			buffer.WriteString("range: decided by ")
			buffer.WriteString(p.rangeInfo)
			buffer.WriteString(", ")
		}
	} else if p.haveCorCol() {
		if normalized {
			buffer.WriteString("range: decided by ")
			buffer.Write(expression.SortedExplainNormalizedExpressionList(p.AccessCondition))
			buffer.WriteString(", ")
		} else {
			buffer.WriteString("range: decided by [")
			for i, AccessCondition := range p.AccessCondition {
				if i != 0 {
					buffer.WriteString(" ")
				}
				buffer.WriteString(AccessCondition.StringWithCtx(ectx, redact))
			}
			buffer.WriteString("], ")
		}
	} else if len(p.Ranges) > 0 {
		if normalized {
			buffer.WriteString("range:[?,?], ")
		} else if !p.isFullScan() {
			buffer.WriteString("range:")
			for _, idxRange := range p.Ranges {
				buffer.WriteString(idxRange.Redact(redact))
				buffer.WriteString(", ")
			}
		}
	}
	if p.SCtx().GetSessionVars().EnableLateMaterialization && len(p.filterCondition) > 0 && p.StoreType == kv.TiFlash {
		if len(p.LateMaterializationFilterCondition) > 0 {
			buffer.WriteString("pushed down filter:")
			if normalized {
				buffer.Write(expression.SortedExplainNormalizedExpressionList(p.LateMaterializationFilterCondition))
			} else {
				buffer.Write(expression.SortedExplainExpressionList(p.SCtx().GetExprCtx().GetEvalCtx(), p.LateMaterializationFilterCondition))
			}
			buffer.WriteString(", ")
		}
	}
	buffer.WriteString("keep order:")
	buffer.WriteString(strconv.FormatBool(p.KeepOrder))
	if p.Desc {
		buffer.WriteString(", desc")
	}
	if !normalized {
		if p.usedStatsInfo != nil {
			str := p.usedStatsInfo.FormatForExplain()
			if len(str) > 0 {
				buffer.WriteString(", ")
				buffer.WriteString(str)
			}
		} else if p.StatsInfo().StatsVersion == statistics.PseudoVersion {
			// This branch is not needed in fact, we add this to prevent test result changes under planner/cascades/
			buffer.WriteString(", stats:pseudo")
		}
	}
	if p.StoreType == kv.TiFlash && p.Table.GetPartitionInfo() != nil && p.IsMPPOrBatchCop && p.SCtx().GetSessionVars().StmtCtx.UseDynamicPartitionPrune() {
		buffer.WriteString(", PartitionTableScan:true")
	}
	if len(p.runtimeFilterList) > 0 {
		buffer.WriteString(", runtime filter:")
		for i, runtimeFilter := range p.runtimeFilterList {
			if i != 0 {
				buffer.WriteString(", ")
			}
			buffer.WriteString(runtimeFilter.ExplainInfo(false))
		}
	}
	if len(p.UsedColumnarIndexes) > 0 {
		annIndexes := make([]string, 0, len(p.UsedColumnarIndexes))
		invertedIndexes := make([]string, 0, len(p.UsedColumnarIndexes))
		for _, idx := range p.UsedColumnarIndexes {
			if idx == nil {
				continue
			}
			if idx.QueryInfo != nil && idx.QueryInfo.IndexType == tipb.ColumnarIndexType_TypeVector {
				annIndexBuffer := bytes.NewBuffer(make([]byte, 0, 256))
				annIndexBuffer.WriteString(idx.QueryInfo.GetAnnQueryInfo().GetDistanceMetric().String())
				annIndexBuffer.WriteString("(")
				annIndexBuffer.WriteString(idx.QueryInfo.GetAnnQueryInfo().GetColumnName())
				annIndexBuffer.WriteString("..")
				if normalized {
					annIndexBuffer.WriteString("[?]")
				} else {
					v, _, err := types.ZeroCopyDeserializeVectorFloat32(idx.QueryInfo.GetAnnQueryInfo().RefVecF32)
					if err != nil {
						annIndexBuffer.WriteString("[?]")
					} else {
						annIndexBuffer.WriteString(v.TruncatedString())
					}
				}
				annIndexBuffer.WriteString(", limit:")
				if normalized {
					annIndexBuffer.WriteString("?")
				} else {
					fmt.Fprint(annIndexBuffer, idx.QueryInfo.GetAnnQueryInfo().TopK)
				}
				annIndexBuffer.WriteString(")")

				if idx.QueryInfo.GetAnnQueryInfo().GetEnableDistanceProj() {
					annIndexBuffer.WriteString("->")
					cols := p.Schema().Columns
					annIndexBuffer.WriteString(cols[len(cols)-1].String())
				}
				annIndexes = append(annIndexes, annIndexBuffer.String())
			} else if idx.QueryInfo.IndexType == tipb.ColumnarIndexType_TypeInverted && idx.QueryInfo != nil {
				invertedIndexes = append(invertedIndexes, idx.IndexInfo.Name.L)
			}
		}
		if len(annIndexes) > 0 {
			buffer.WriteString(", annIndex:")
			buffer.WriteString(strings.Join(annIndexes, ", "))
		}
		if len(invertedIndexes) > 0 {
			buffer.WriteString(", invertedindex:")
			buffer.WriteString(strings.Join(invertedIndexes, ", "))
		}
	}

	return buffer.String()
}

func (p *PhysicalTableScan) haveCorCol() bool {
	for _, cond := range p.AccessCondition {
		if len(expression.ExtractCorColumns(cond)) > 0 {
			return true
		}
	}
	return false
}

func (p *PhysicalTableScan) isFullScan() bool {
	if len(p.rangeInfo) > 0 || p.haveCorCol() {
		return false
	}
	var unsignedIntHandle bool
	if p.Table.PKIsHandle {
		if pkColInfo := p.Table.GetPkColInfo(); pkColInfo != nil {
			unsignedIntHandle = mysql.HasUnsignedFlag(pkColInfo.GetFlag())
		}
	}
	for _, ran := range p.Ranges {
		if !ran.IsFullRange(unsignedIntHandle) {
			return false
		}
	}
	return true
}

// ExplainInfo implements Plan interface.
func (p *PhysicalTableReader) ExplainInfo() string {
	tablePlanInfo := "data:" + p.tablePlan.ExplainID().String()

	if p.ReadReqType == MPP {
		return fmt.Sprintf("MppVersion: %d, %s", p.SCtx().GetSessionVars().ChooseMppVersion(), tablePlanInfo)
	}

	return tablePlanInfo
}

// ExplainNormalizedInfo implements Plan interface.
func (*PhysicalTableReader) ExplainNormalizedInfo() string {
	return ""
}

// OperatorInfo return other operator information to be explained.
func (p *PhysicalTableReader) OperatorInfo(_ bool) string {
	return "data:" + p.tablePlan.ExplainID().String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalIndexReader) ExplainInfo() string {
	return "index:" + p.indexPlan.ExplainID().String()
}

// ExplainNormalizedInfo implements Plan interface.
func (p *PhysicalIndexReader) ExplainNormalizedInfo() string {
	return "index:" + p.indexPlan.TP()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalIndexLookUpReader) ExplainInfo() string {
	var str strings.Builder
	// The children can be inferred by the relation symbol.
	if p.PushedLimit != nil {
		str.WriteString("limit embedded(offset:")
		str.WriteString(strconv.FormatUint(p.PushedLimit.Offset, 10))
		str.WriteString(", count:")
		str.WriteString(strconv.FormatUint(p.PushedLimit.Count, 10))
		str.WriteString(")")
	}
	return str.String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalIndexMergeReader) ExplainInfo() string {
	var str strings.Builder
	if p.IsIntersectionType {
		str.WriteString("type: intersection")
	} else {
		str.WriteString("type: union")
	}
	if p.PushedLimit != nil {
		str.WriteString(", limit embedded(offset:")
		str.WriteString(strconv.FormatUint(p.PushedLimit.Offset, 10))
		str.WriteString(", count:")
		str.WriteString(strconv.FormatUint(p.PushedLimit.Count, 10))
		str.WriteString(")")
	}
	return str.String()
}

func (p *PhysicalExpand) explainInfoV2() string {
	sb := strings.Builder{}
	evalCtx := p.SCtx().GetExprCtx().GetEvalCtx()
	enableRedactLog := p.SCtx().GetSessionVars().EnableRedactLog
	for i, oneL := range p.LevelExprs {
		if i == 0 {
			sb.WriteString("level-projection:")
			sb.WriteString("[")
			sb.WriteString(expression.ExplainExpressionList(evalCtx, oneL, p.Schema(), enableRedactLog))
			sb.WriteString("]")
		} else {
			sb.WriteString(",[")
			sb.WriteString(expression.ExplainExpressionList(evalCtx, oneL, p.Schema(), enableRedactLog))
			sb.WriteString("]")
		}
	}
	sb.WriteString("; schema: [")
	colStrs := make([]string, 0, len(p.Schema().Columns))
	for _, col := range p.Schema().Columns {
		colStrs = append(colStrs, col.StringWithCtx(evalCtx, perrors.RedactLogDisable))
	}
	sb.WriteString(strings.Join(colStrs, ","))
	sb.WriteString("]")
	return sb.String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalExpand) ExplainInfo() string {
	ectx := p.SCtx().GetExprCtx().GetEvalCtx()
	if len(p.LevelExprs) > 0 {
		return p.explainInfoV2()
	}
	var str strings.Builder
	str.WriteString("group set num:")
	str.WriteString(strconv.FormatInt(int64(len(p.GroupingSets)), 10))
	if p.GroupingIDCol != nil {
		str.WriteString(", groupingID:")
		str.WriteString(p.GroupingIDCol.StringWithCtx(ectx, perrors.RedactLogDisable))
		str.WriteString(", ")
	}
	str.WriteString(p.GroupingSets.StringWithCtx(ectx, perrors.RedactLogDisable))
	return str.String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalIndexMergeJoin) ExplainInfo() string {
	return p.PhysicalIndexJoin.ExplainInfoInternal(false, true)
}

// ExplainNormalizedInfo implements Plan interface.
func (p *PhysicalIndexMergeJoin) ExplainNormalizedInfo() string {
	return p.PhysicalIndexJoin.ExplainInfoInternal(true, true)
}

// ExplainInfo implements Plan interface.
func (p *PhysicalHashJoin) ExplainInfo() string {
	return p.explainInfo(false)
}

// ExplainNormalizedInfo implements Plan interface.
func (p *PhysicalHashJoin) ExplainNormalizedInfo() string {
	return p.explainInfo(true)
}

func (p *PhysicalHashJoin) explainInfo(normalized bool) string {
	sortedExplainExpressionList := expression.SortedExplainExpressionList
	if normalized {
		sortedExplainExpressionList = func(_ expression.EvalContext, exprs []expression.Expression) []byte {
			return expression.SortedExplainNormalizedExpressionList(exprs)
		}
	}
	redact := p.SCtx().GetSessionVars().EnableRedactLog
	buffer := new(strings.Builder)

	if len(p.EqualConditions) == 0 {
		if len(p.NAEqualConditions) == 0 {
			buffer.WriteString("CARTESIAN ")
		} else {
			buffer.WriteString("Null-aware ")
		}
	}

	buffer.WriteString(p.JoinType.String())
	physicalop.ExplainJoinLeftSide(buffer, p.JoinType.IsInnerJoin(), normalized, p.Children()[0])
	evalCtx := p.SCtx().GetExprCtx().GetEvalCtx()
	if len(p.EqualConditions) > 0 {
		if normalized {
			buffer.WriteString(", equal:")
			buffer.Write(expression.SortedExplainNormalizedScalarFuncList(p.EqualConditions))
		} else {
			buffer.WriteString(", equal:[")
			for i, EqualConditions := range p.EqualConditions {
				if i != 0 {
					buffer.WriteString(" ")
				}
				buffer.WriteString(EqualConditions.StringWithCtx(evalCtx, redact))
			}
			buffer.WriteString("]")
		}
	}
	if len(p.NAEqualConditions) > 0 {
		if normalized {
			buffer.WriteString(", equal:")
			buffer.Write(expression.SortedExplainNormalizedScalarFuncList(p.NAEqualConditions))
		} else {
			buffer.WriteString(", equal:[")
			for i, NAEqualCondition := range p.NAEqualConditions {
				if i != 0 {
					buffer.WriteString(" ")
				}
				buffer.WriteString(NAEqualCondition.StringWithCtx(evalCtx, redact))
			}
			buffer.WriteString("]")
		}
	}
	if len(p.LeftConditions) > 0 {
		if normalized {
			buffer.WriteString(", left cond:")
			buffer.Write(expression.SortedExplainNormalizedExpressionList(p.LeftConditions))
		} else {
			buffer.WriteString(", left cond:[")
			for i, LeftConditions := range p.LeftConditions {
				if i != 0 {
					buffer.WriteString(" ")
				}
				buffer.WriteString(LeftConditions.StringWithCtx(evalCtx, redact))
			}
			buffer.WriteString("]")
		}
	}
	if len(p.RightConditions) > 0 {
		buffer.WriteString(", right cond:")
		buffer.Write(sortedExplainExpressionList(evalCtx, p.RightConditions))
	}
	if len(p.OtherConditions) > 0 {
		buffer.WriteString(", other cond:")
		buffer.Write(sortedExplainExpressionList(evalCtx, p.OtherConditions))
	}
	if p.TiFlashFineGrainedShuffleStreamCount > 0 {
		fmt.Fprintf(buffer, ", stream_count: %d", p.TiFlashFineGrainedShuffleStreamCount)
	}

	// for runtime filter
	if len(p.runtimeFilterList) > 0 {
		buffer.WriteString(", runtime filter:")
		for i, runtimeFilter := range p.runtimeFilterList {
			if i != 0 {
				buffer.WriteString(", ")
			}
			buffer.WriteString(runtimeFilter.ExplainInfo(true))
		}
	}
	return buffer.String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalShuffle) ExplainInfo() string {
	explainIDs := make([]fmt.Stringer, len(p.DataSources))
	for i := range p.DataSources {
		explainIDs[i] = p.DataSources[i].ExplainID()
	}

	buffer := bytes.NewBufferString("")
	fmt.Fprintf(buffer, "execution info: concurrency:%v, data sources:%v", p.Concurrency, explainIDs)
	return buffer.String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalExchangeSender) ExplainInfo() string {
	buffer := bytes.NewBufferString("ExchangeType: ")
	switch p.ExchangeType {
	case tipb.ExchangeType_PassThrough:
		fmt.Fprintf(buffer, "PassThrough")
	case tipb.ExchangeType_Broadcast:
		fmt.Fprintf(buffer, "Broadcast")
	case tipb.ExchangeType_Hash:
		fmt.Fprintf(buffer, "HashPartition")
	}
	if p.CompressionMode != vardef.ExchangeCompressionModeNONE {
		fmt.Fprintf(buffer, ", Compression: %s", p.CompressionMode.Name())
	}
	if p.ExchangeType == tipb.ExchangeType_Hash {
		fmt.Fprintf(buffer, ", Hash Cols: %s", property.ExplainColumnList(p.SCtx().GetExprCtx().GetEvalCtx(), p.HashCols))
	}
	if len(p.Tasks) > 0 {
		fmt.Fprintf(buffer, ", tasks: [")
		for idx, task := range p.Tasks {
			if idx != 0 {
				fmt.Fprintf(buffer, ", ")
			}
			fmt.Fprintf(buffer, "%v", task.ID)
		}
		fmt.Fprintf(buffer, "]")
	}
	if p.TiFlashFineGrainedShuffleStreamCount > 0 {
		fmt.Fprintf(buffer, ", stream_count: %d", p.TiFlashFineGrainedShuffleStreamCount)
	}
	return buffer.String()
}

// ExplainInfo implements Plan interface.
func (p *PhysicalExchangeReceiver) ExplainInfo() (res string) {
	if p.TiFlashFineGrainedShuffleStreamCount > 0 {
		res = fmt.Sprintf("stream_count: %d", p.TiFlashFineGrainedShuffleStreamCount)
	}
	return res
}
