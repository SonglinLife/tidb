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

package cardinality

import (
	"github.com/pingcap/errors"
	"github.com/pingcap/tidb/pkg/planner/planctx"
	"github.com/pingcap/tidb/pkg/planner/util/debugtrace"
	"github.com/pingcap/tidb/pkg/planner/util/fixcontrol"
	"github.com/pingcap/tidb/pkg/statistics"
	"github.com/pingcap/tidb/pkg/types"
	"github.com/pingcap/tidb/pkg/util/codec"
	"github.com/pingcap/tidb/pkg/util/collate"
	"github.com/pingcap/tidb/pkg/util/mathutil"
	"github.com/pingcap/tidb/pkg/util/ranger"
)

func init() {
	statistics.GetRowCountByColumnRanges = GetRowCountByColumnRanges
	statistics.GetRowCountByIntColumnRanges = GetRowCountByIntColumnRanges
	statistics.GetRowCountByIndexRanges = GetRowCountByIndexRanges
}

// GetRowCountByColumnRanges estimates the row count by a slice of Range.
func GetRowCountByColumnRanges(sctx planctx.PlanContext, coll *statistics.HistColl, colUniqueID int64, colRanges []*ranger.Range) (result float64, err error) {
	var name string
	if sctx.GetSessionVars().StmtCtx.EnableOptimizerDebugTrace {
		debugtrace.EnterContextCommon(sctx)
		debugTraceGetRowCountInput(sctx, colUniqueID, colRanges)
		defer func() {
			debugtrace.RecordAnyValuesWithNames(sctx, "Name", name, "Result", result)
			debugtrace.LeaveContextCommon(sctx)
		}()
	}
	sc := sctx.GetSessionVars().StmtCtx
	c := coll.GetCol(colUniqueID)
	colInfoID := colUniqueID
	if len(coll.UniqueID2colInfoID) > 0 {
		colInfoID = coll.UniqueID2colInfoID[colUniqueID]
	}
	recordUsedItemStatsStatus(sctx, c, coll.PhysicalID, colInfoID)
	if c != nil && c.Info != nil {
		name = c.Info.Name.O
	}
	if statistics.ColumnStatsIsInvalid(c, sctx, coll, colUniqueID) {
		result, err = getPseudoRowCountByColumnRanges(sc.TypeCtx(), float64(coll.RealtimeCount), colRanges, 0)
		if err == nil && sc.EnableOptimizerCETrace && c != nil {
			ceTraceRange(sctx, coll.PhysicalID, []string{c.Info.Name.O}, colRanges, "Column Stats-Pseudo", uint64(result))
		}
		return result, err
	}
	if sctx.GetSessionVars().StmtCtx.EnableOptimizerDebugTrace {
		debugtrace.RecordAnyValuesWithNames(sctx,
			"Histogram NotNull Count", c.Histogram.NotNullCount(),
			"TopN total count", c.TopN.TotalCount(),
			"Increase Factor", c.GetIncreaseFactor(coll.RealtimeCount),
		)
	}
	result, err = GetColumnRowCount(sctx, c, colRanges, coll.RealtimeCount, coll.ModifyCount, false)
	if sc.EnableOptimizerCETrace {
		ceTraceRange(sctx, coll.PhysicalID, []string{c.Info.Name.O}, colRanges, "Column Stats", uint64(result))
	}
	return result, errors.Trace(err)
}

// GetRowCountByIntColumnRanges estimates the row count by a slice of IntColumnRange.
func GetRowCountByIntColumnRanges(sctx planctx.PlanContext, coll *statistics.HistColl, colUniqueID int64, intRanges []*ranger.Range) (result float64, err error) {
	var name string
	if sctx.GetSessionVars().StmtCtx.EnableOptimizerDebugTrace {
		debugtrace.EnterContextCommon(sctx)
		debugTraceGetRowCountInput(sctx, colUniqueID, intRanges)
		defer func() {
			debugtrace.RecordAnyValuesWithNames(sctx, "Name", name, "Result", result)
			debugtrace.LeaveContextCommon(sctx)
		}()
	}
	sc := sctx.GetSessionVars().StmtCtx
	c := coll.GetCol(colUniqueID)
	colInfoID := colUniqueID
	if len(coll.UniqueID2colInfoID) > 0 {
		colInfoID = coll.UniqueID2colInfoID[colUniqueID]
	}
	recordUsedItemStatsStatus(sctx, c, coll.PhysicalID, colInfoID)
	if c != nil && c.Info != nil {
		name = c.Info.Name.O
	}
	if statistics.ColumnStatsIsInvalid(c, sctx, coll, colUniqueID) {
		if len(intRanges) == 0 {
			return 0, nil
		}
		if intRanges[0].LowVal[0].Kind() == types.KindInt64 {
			result = getPseudoRowCountBySignedIntRanges(intRanges, float64(coll.RealtimeCount))
		} else {
			result = getPseudoRowCountByUnsignedIntRanges(intRanges, float64(coll.RealtimeCount))
		}
		if sc.EnableOptimizerCETrace && c != nil {
			ceTraceRange(sctx, coll.PhysicalID, []string{c.Info.Name.O}, intRanges, "Column Stats-Pseudo", uint64(result))
		}
		return result, nil
	}
	if sctx.GetSessionVars().StmtCtx.EnableOptimizerDebugTrace {
		debugtrace.RecordAnyValuesWithNames(sctx,
			"Histogram NotNull Count", c.Histogram.NotNullCount(),
			"TopN total count", c.TopN.TotalCount(),
			"Increase Factor", c.GetIncreaseFactor(coll.RealtimeCount),
		)
	}
	result, err = GetColumnRowCount(sctx, c, intRanges, coll.RealtimeCount, coll.ModifyCount, true)
	if sc.EnableOptimizerCETrace {
		ceTraceRange(sctx, coll.PhysicalID, []string{c.Info.Name.O}, intRanges, "Column Stats", uint64(result))
	}
	return result, errors.Trace(err)
}

// equalRowCountOnColumn estimates the row count by a slice of Range and a Datum.
func equalRowCountOnColumn(sctx planctx.PlanContext, c *statistics.Column, val types.Datum, encodedVal []byte, realtimeRowCount, modifyCount int64) (result float64, err error) {
	if sctx.GetSessionVars().StmtCtx.EnableOptimizerDebugTrace {
		debugtrace.EnterContextCommon(sctx)
		debugtrace.RecordAnyValuesWithNames(sctx, "Value", val.String(), "Encoded", encodedVal)
		defer func() {
			debugtrace.RecordAnyValuesWithNames(sctx, "Result", result, "Error", err)
			debugtrace.LeaveContextCommon(sctx)
		}()
	}
	if val.IsNull() {
		return float64(c.NullCount), nil
	}
	if c.StatsVer < statistics.Version2 {
		// All the values are null.
		if c.Histogram.Bounds.NumRows() == 0 {
			return 0.0, nil
		}
		if c.Histogram.NDV > 0 && c.OutOfRange(val) {
			return outOfRangeEQSelectivity(sctx, c.Histogram.NDV, realtimeRowCount, int64(c.TotalRowCount())) * c.TotalRowCount(), nil
		}
		if c.CMSketch != nil {
			count, err := statistics.QueryValue(sctx, c.CMSketch, c.TopN, val)
			return float64(count), errors.Trace(err)
		}
		histRowCount, _ := c.Histogram.EqualRowCount(sctx, val, false)
		return histRowCount, nil
	}

	// Stats version == 2
	// All the values are null.
	if c.Histogram.Bounds.NumRows() == 0 && c.TopN.Num() == 0 {
		return 0, nil
	}
	// 1. try to find this value in TopN
	if c.TopN != nil {
		rowcount, ok := c.TopN.QueryTopN(sctx, encodedVal)
		if ok {
			return float64(rowcount), nil
		}
	}
	// 2. try to find this value in bucket.Repeat(the last value in every bucket)
	histCnt, matched := c.Histogram.EqualRowCount(sctx, val, true)
	// Calculate histNDV here as it's needed for both the underrepresented check and later calculations
	histNDV := float64(c.Histogram.NDV - int64(c.TopN.Num()))
	// also check if this last bucket end value is underrepresented
	if matched && !IsLastBucketEndValueUnderrepresented(sctx,
		&c.Histogram, val, histCnt, histNDV, realtimeRowCount, modifyCount) {
		return histCnt, nil
	}
	// 3. use uniform distribution assumption for the rest (even when this value is not covered by the range of stats)
	// branch1: histDNV <= 0 means that all NDV's are in TopN, and no histograms.
	// branch2: histDNA > 0 basically means while there is still a case, c.Histogram.NDV >
	// c.TopN.Num() a little bit, but the histogram is still empty. In this case, we should use the branch1 and for the diff
	// in NDV, it's mainly comes from the NDV is conducted and calculated ahead of sampling.
	if histNDV <= 0 || (c.IsFullLoad() && c.Histogram.NotNullCount() == 0) {
		// branch 1: all NDV's are in TopN, and no histograms
		// If histNDV is zero - we have all NDV's in TopN - and no histograms. This function uses
		// c.NotNullCount rather than c.Histogram.NotNullCount() since the histograms are empty.
		// c.Histogram.NDV stores the full NDV regardless of histograms empty or populated.
		if histNDV > 0 && modifyCount == 0 {
			return max(float64(c.TopN.MinCount()-1), 1), nil
		}
		increaseFactor := c.GetIncreaseFactor(realtimeRowCount)
		return outOfRangeFullNDV(float64(c.Histogram.NDV), c.TotalRowCount(), c.NotNullCount(), float64(realtimeRowCount), increaseFactor, modifyCount), nil
	}
	// branch 2: some NDV's are in histograms
	// return the average histogram rows (which excludes topN) and NDV that excluded topN
	return c.Histogram.NotNullCount() / histNDV, nil
}

// GetColumnRowCount estimates the row count by a slice of Range.
func GetColumnRowCount(sctx planctx.PlanContext, c *statistics.Column, ranges []*ranger.Range, realtimeRowCount, modifyCount int64, pkIsHandle bool) (float64, error) {
	sc := sctx.GetSessionVars().StmtCtx
	debugTrace := sc.EnableOptimizerDebugTrace
	if debugTrace {
		debugtrace.EnterContextCommon(sctx)
		defer debugtrace.LeaveContextCommon(sctx)
	}
	var rowCount float64
	for _, rg := range ranges {
		highVal := *rg.HighVal[0].Clone()
		lowVal := *rg.LowVal[0].Clone()
		if highVal.Kind() == types.KindString {
			highVal.SetBytes(collate.GetCollator(highVal.Collation()).Key(highVal.GetString()))
		}
		if lowVal.Kind() == types.KindString {
			lowVal.SetBytes(collate.GetCollator(lowVal.Collation()).Key(lowVal.GetString()))
		}
		cmp, err := lowVal.Compare(sc.TypeCtx(), &highVal, collate.GetBinaryCollator())
		if err != nil {
			return 0, errors.Trace(err)
		}
		lowEncoded, err := codec.EncodeKey(sc.TimeZone(), nil, lowVal)
		err = sc.HandleError(err)
		if err != nil {
			return 0, err
		}
		highEncoded, err := codec.EncodeKey(sc.TimeZone(), nil, highVal)
		err = sc.HandleError(err)
		if err != nil {
			return 0, err
		}
		if debugTrace {
			debugTraceStartEstimateRange(sctx, rg, lowEncoded, highEncoded, rowCount)
		}
		if cmp == 0 {
			// case 1: it's a point
			if !rg.LowExclude && !rg.HighExclude {
				// In this case, the row count is at most 1.
				if pkIsHandle {
					rowCount++
					if debugTrace {
						debugTraceEndEstimateRange(sctx, 1, debugTraceUniquePoint)
					}
					continue
				}
				var cnt float64
				cnt, err = equalRowCountOnColumn(sctx, c, lowVal, lowEncoded, realtimeRowCount, modifyCount)
				if err != nil {
					return 0, errors.Trace(err)
				}
				// If the current table row count has changed, we should scale the row count accordingly.
				cnt *= c.GetIncreaseFactor(realtimeRowCount)
				rowCount += cnt
				if debugTrace {
					debugTraceEndEstimateRange(sctx, cnt, debugTracePoint)
				}
			}
			continue
		}
		// In stats ver 1, we use CM Sketch to estimate row count for point condition, which is more accurate.
		// So for the small range, we convert it to points.
		if c.StatsVer < 2 {
			rangeVals := statistics.EnumRangeValues(lowVal, highVal, rg.LowExclude, rg.HighExclude)

			// case 2: it's a small range && using ver1 stats
			if rangeVals != nil {
				for _, val := range rangeVals {
					cnt, err := equalRowCountOnColumn(sctx, c, val, lowEncoded, realtimeRowCount, modifyCount)
					if err != nil {
						return 0, err
					}
					// If the current table row count has changed, we should scale the row count accordingly.
					cnt *= c.GetIncreaseFactor(realtimeRowCount)
					if debugTrace {
						debugTraceEndEstimateRange(sctx, cnt, debugTraceVer1SmallRange)
					}
					rowCount += cnt
				}

				continue
			}
		}

		// case 3: it's an interval
		cnt := betweenRowCountOnColumn(sctx, c, lowVal, highVal, lowEncoded, highEncoded)
		// `betweenRowCount` returns count for [l, h) range, we adjust cnt for boundaries here.
		// Note that, `cnt` does not include null values, we need specially handle cases
		//   where null is the lower bound.
		// And because we use (2, MaxValue] to represent expressions like a > 2 and use [MinNotNull, 3) to represent
		//   expressions like b < 3, we need to exclude the special values.
		if rg.LowExclude && !lowVal.IsNull() && lowVal.Kind() != types.KindMaxValue && lowVal.Kind() != types.KindMinNotNull {
			lowCnt, err := equalRowCountOnColumn(sctx, c, lowVal, lowEncoded, realtimeRowCount, modifyCount)
			if err != nil {
				return 0, errors.Trace(err)
			}
			cnt -= lowCnt
			cnt = mathutil.Clamp(cnt, 0, c.NotNullCount())
		}
		if !rg.LowExclude && lowVal.IsNull() {
			cnt += float64(c.NullCount)
		}
		if !rg.HighExclude && highVal.Kind() != types.KindMaxValue && highVal.Kind() != types.KindMinNotNull {
			highCnt, err := equalRowCountOnColumn(sctx, c, highVal, highEncoded, realtimeRowCount, modifyCount)
			if err != nil {
				return 0, errors.Trace(err)
			}
			cnt += highCnt
		}

		cnt = mathutil.Clamp(cnt, 0, c.TotalRowCount())

		// If the current table row count has changed, we should scale the row count accordingly.
		increaseFactor := c.GetIncreaseFactor(realtimeRowCount)
		cnt *= increaseFactor

		// handling the out-of-range part
		if (c.OutOfRange(lowVal) && !lowVal.IsNull()) || c.OutOfRange(highVal) {
			histNDV := c.NDV
			// Exclude the TopN
			if c.StatsVer == statistics.Version2 {
				histNDV -= int64(c.TopN.Num())
			}
			cnt += c.Histogram.OutOfRangeRowCount(sctx, &lowVal, &highVal, realtimeRowCount, modifyCount, histNDV)
		}

		if debugTrace {
			debugTraceEndEstimateRange(sctx, cnt, debugTraceRange)
		}
		rowCount += cnt
	}
	allowZeroEst := fixcontrol.GetBoolWithDefault(
		sctx.GetSessionVars().GetOptimizerFixControlMap(),
		fixcontrol.Fix47400,
		false,
	)
	if allowZeroEst {
		rowCount = mathutil.Clamp(rowCount, 0, float64(realtimeRowCount))
	} else {
		// Don't allow the final result to go below 1 row
		rowCount = mathutil.Clamp(rowCount, 1, float64(realtimeRowCount))
	}
	return rowCount, nil
}

// betweenRowCountOnColumn estimates the row count for interval [l, r).
func betweenRowCountOnColumn(sctx planctx.PlanContext, c *statistics.Column, l, r types.Datum, lowEncoded, highEncoded []byte) float64 {
	histBetweenCnt := c.Histogram.BetweenRowCount(sctx, l, r)
	if c.StatsVer <= statistics.Version1 {
		return histBetweenCnt
	}
	return float64(c.TopN.BetweenCount(sctx, lowEncoded, highEncoded)) + histBetweenCnt
}

// functions below are mainly for testing.

// ColumnGreaterRowCount estimates the row count where the column greater than value.
func ColumnGreaterRowCount(sctx planctx.PlanContext, t *statistics.Table, value types.Datum, colID int64) float64 {
	c := t.GetCol(colID)
	if statistics.ColumnStatsIsInvalid(c, sctx, &t.HistColl, colID) {
		return float64(t.RealtimeCount) / pseudoLessRate
	}
	return c.GreaterRowCount(value) * c.GetIncreaseFactor(t.RealtimeCount)
}

// columnLessRowCount estimates the row count where the column less than value. Note that null values are not counted.
func columnLessRowCount(sctx planctx.PlanContext, t *statistics.Table, value types.Datum, colID int64) float64 {
	c := t.GetCol(colID)
	if statistics.ColumnStatsIsInvalid(c, sctx, &t.HistColl, colID) {
		return float64(t.RealtimeCount) / pseudoLessRate
	}
	return c.LessRowCount(sctx, value) * c.GetIncreaseFactor(t.RealtimeCount)
}

// columnBetweenRowCount estimates the row count where column greater or equal to a and less than b.
func columnBetweenRowCount(sctx planctx.PlanContext, t *statistics.Table, a, b types.Datum, colID int64) (float64, error) {
	sc := sctx.GetSessionVars().StmtCtx
	c := t.GetCol(colID)
	if statistics.ColumnStatsIsInvalid(c, sctx, &t.HistColl, colID) {
		return float64(t.RealtimeCount) / pseudoBetweenRate, nil
	}
	aEncoded, err := codec.EncodeKey(sc.TimeZone(), nil, a)
	err = sc.HandleError(err)
	if err != nil {
		return 0, err
	}
	bEncoded, err := codec.EncodeKey(sc.TimeZone(), nil, b)
	err = sc.HandleError(err)
	if err != nil {
		return 0, err
	}
	count := betweenRowCountOnColumn(sctx, c, a, b, aEncoded, bEncoded)
	if a.IsNull() {
		count += float64(c.NullCount)
	}
	return count * c.GetIncreaseFactor(t.RealtimeCount), nil
}

// ColumnEqualRowCount estimates the row count where the column equals to value.
func ColumnEqualRowCount(sctx planctx.PlanContext, t *statistics.Table, value types.Datum, colID int64) (float64, error) {
	c := t.GetCol(colID)
	if statistics.ColumnStatsIsInvalid(c, sctx, &t.HistColl, colID) {
		return float64(t.RealtimeCount) / pseudoEqualRate, nil
	}
	encodedVal, err := codec.EncodeKey(sctx.GetSessionVars().StmtCtx.TimeZone(), nil, value)
	err = sctx.GetSessionVars().StmtCtx.HandleError(err)
	if err != nil {
		return 0, err
	}
	result, err := equalRowCountOnColumn(sctx, c, value, encodedVal, t.RealtimeCount, t.ModifyCount)
	result *= c.GetIncreaseFactor(t.RealtimeCount)
	return result, errors.Trace(err)
}
