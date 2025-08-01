// Copyright 2020 PingCAP, Inc.
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

package ddl

import (
	"bytes"
	"context"
	"encoding/hex"
	"fmt"
	"strconv"
	"strings"
	"sync"
	"sync/atomic"
	"time"

	"github.com/pingcap/errors"
	"github.com/pingcap/failpoint"
	"github.com/pingcap/tidb/pkg/config"
	"github.com/pingcap/tidb/pkg/ddl/ingest"
	"github.com/pingcap/tidb/pkg/ddl/logutil"
	sess "github.com/pingcap/tidb/pkg/ddl/session"
	"github.com/pingcap/tidb/pkg/disttask/operator"
	"github.com/pingcap/tidb/pkg/expression"
	"github.com/pingcap/tidb/pkg/expression/exprctx"
	"github.com/pingcap/tidb/pkg/expression/exprstatic"
	"github.com/pingcap/tidb/pkg/kv"
	"github.com/pingcap/tidb/pkg/lightning/backend/local"
	"github.com/pingcap/tidb/pkg/meta/model"
	"github.com/pingcap/tidb/pkg/metrics"
	"github.com/pingcap/tidb/pkg/parser/ast"
	"github.com/pingcap/tidb/pkg/parser/terror"
	"github.com/pingcap/tidb/pkg/sessionctx/vardef"
	"github.com/pingcap/tidb/pkg/table"
	"github.com/pingcap/tidb/pkg/tablecodec"
	"github.com/pingcap/tidb/pkg/util"
	contextutil "github.com/pingcap/tidb/pkg/util/context"
	"github.com/pingcap/tidb/pkg/util/dbterror"
	decoder "github.com/pingcap/tidb/pkg/util/rowDecoder"
	"github.com/pingcap/tidb/pkg/util/topsql"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/tikv/client-go/v2/tikv"
	kvutil "github.com/tikv/client-go/v2/util"
	"go.uber.org/zap"
)

type backfillerType byte

const (
	typeAddIndexWorker backfillerType = iota
	typeUpdateColumnWorker
	typeCleanUpIndexWorker
	typeAddIndexMergeTmpWorker
	typeReorgPartitionWorker

	typeCount
)

// BackupFillerTypeCount represents the count of ddl jobs that need to do backfill.
func BackupFillerTypeCount() int {
	return int(typeCount)
}

func (bT backfillerType) String() string {
	switch bT {
	case typeAddIndexWorker:
		return "add index"
	case typeUpdateColumnWorker:
		return "update column"
	case typeCleanUpIndexWorker:
		return "clean up index"
	case typeAddIndexMergeTmpWorker:
		return "merge temporary index"
	case typeReorgPartitionWorker:
		return "reorganize partition"
	default:
		return "unknown"
	}
}

// By now the DDL jobs that need backfilling include:
// 1: add-index
// 2: modify-column-type
// 3: clean-up global index
// 4: reorganize partition
//
// They all have a write reorganization state to back fill data into the rows existed.
// Backfilling is time consuming, to accelerate this process, TiDB has built some sub
// workers to do this in the DDL owner node.
//
//                       DDL owner thread (also see comments before runReorgJob func)
//                                      ^
//                                      | (reorgCtx.doneCh)
//                                      |
//                                worker master
//                                      ^ (waitTaskResults)
//                                      |
//                                      |
//                                      v (sendRangeTask)
//       +--------------------+---------+---------+------------------+--------------+
//       |                    |                   |                  |              |
// backfillworker1     backfillworker2     backfillworker3     backfillworker4     ...
//
// The worker master is responsible for scaling the backfilling workers according to the
// system variable "tidb_ddl_reorg_worker_cnt". Essentially, reorg job is mainly based
// on the [start, end] range of the table to backfill data. We did not do it all at once,
// there were several ddl rounds.
//
// [start1---end1 start2---end2 start3---end3 start4---end4 ...         ...         ]
//    |       |     |       |     |       |     |       |
//    +-------+     +-------+     +-------+     +-------+   ...         ...
//        |             |             |             |
//     bfworker1    bfworker2     bfworker3     bfworker4   ...         ...
//        |             |             |             |       |            |
//        +---------------- (round1)----------------+       +--(round2)--+
//
// The main range [start, end] will be split into small ranges.
// Each small range corresponds to a region and it will be delivered to a backfillworker.
// Each worker can only be assigned with one range at one round, those remaining ranges
// will be cached until all the backfill workers have had their previous range jobs done.
//
//                [ region start --------------------- region end ]
//                                        |
//                                        v
//                [ batch ] [ batch ] [ batch ] [ batch ] ...
//                    |         |         |         |
//                    v         v         v         v
//                (a kv txn)   ->        ->        ->
//
// For a single range, backfill worker doesn't backfill all the data in one kv transaction.
// Instead, it is divided into batches, each time a kv transaction completes the backfilling
// of a partial batch.

// backfillTaskContext is the context of the batch adding indices or updating column values.
// After finishing the batch adding indices or updating column values, result in backfillTaskContext will be merged into backfillResult.
type backfillTaskContext struct {
	nextKey       kv.Key
	done          bool
	addedCount    int
	scanCount     int
	warnings      map[errors.ErrorID]*terror.Error
	warningsCount map[errors.ErrorID]int64
	finishTS      uint64
}

type backfillCtx struct {
	id int
	*ddlCtx
	warnings   contextutil.WarnHandlerExt
	loc        *time.Location
	exprCtx    exprctx.BuildContext
	tblCtx     table.MutateContext
	schemaName string
	table      table.Table
	batchCnt   int
	jobContext *ReorgContext

	metricCounter   prometheus.Counter
	conflictCounter prometheus.Counter
}

func newBackfillCtx(id int, rInfo *reorgInfo, schemaName string, tbl table.Table, jobCtx *ReorgContext, label string, isUpdateColumn bool) (*backfillCtx, error) {
	warnHandler := contextutil.NewStaticWarnHandler(0)
	exprCtx, err := newReorgExprCtxWithReorgMeta(rInfo.ReorgMeta, warnHandler)
	if err != nil {
		return nil, errors.Trace(err)
	}

	if isUpdateColumn {
		// The below case should be compatible with mysql behavior:
		// > create table t (a int);
		// > insert into t values (0);
		// > alter table t modify column a date;
		// The alter DDL should return an error in strict mode and success in non-strict mode.
		// See: https://github.com/pingcap/tidb/pull/25728 for more details.
		hasStrictMode := rInfo.ReorgMeta.SQLMode.HasStrictMode()
		tc := exprCtx.GetStaticEvalCtx().TypeCtx()
		evalCtx := exprCtx.GetStaticEvalCtx().Apply(exprstatic.WithTypeFlags(
			tc.Flags().WithIgnoreZeroDateErr(!hasStrictMode),
		))
		exprCtx = exprCtx.Apply(exprstatic.WithEvalCtx(evalCtx))
	}

	tblCtx := newReorgTableMutateContext(exprCtx)

	colOrIdxName := ""
	switch rInfo.Job.Type {
	case model.ActionAddIndex, model.ActionAddPrimaryKey:
		args, err := model.GetModifyIndexArgs(rInfo.Job)
		if err != nil {
			logutil.DDLLogger().Error("Fail to get ModifyIndexArgs", zap.String("label", label), zap.String("schemaName", schemaName), zap.String("tableName", tbl.Meta().Name.String()))
		} else {
			colOrIdxName = getIdxNamesFromArgs(args)
		}
	case model.ActionModifyColumn:
		oldCol, _ := getOldAndNewColumnsForUpdateColumn(tbl, rInfo.currElement.ID)
		if oldCol != nil {
			colOrIdxName = oldCol.Name.String()
		}
	}

	batchCnt := rInfo.ReorgMeta.GetBatchSize()
	return &backfillCtx{
		id:         id,
		ddlCtx:     rInfo.jobCtx.oldDDLCtx,
		warnings:   warnHandler,
		exprCtx:    exprCtx,
		tblCtx:     tblCtx,
		loc:        exprCtx.GetEvalCtx().Location(),
		schemaName: schemaName,
		table:      tbl,
		batchCnt:   batchCnt,
		jobContext: jobCtx,
		metricCounter: metrics.GetBackfillTotalByLabel(
			label, schemaName, tbl.Meta().Name.String(), colOrIdxName),
		conflictCounter: metrics.GetBackfillTotalByLabel(
			fmt.Sprintf("%s-conflict", label), schemaName, tbl.Meta().Name.String(), colOrIdxName),
	}, nil
}

func getIdxNamesFromArgs(args *model.ModifyIndexArgs) string {
	var sb strings.Builder
	for i, idx := range args.IndexArgs {
		if i > 0 {
			sb.WriteString("+")
		}
		sb.WriteString(idx.IndexName.O)
	}
	return sb.String()
}

func updateTxnEntrySizeLimitIfNeeded(txn kv.Transaction) {
	if entrySizeLimit := vardef.TxnEntrySizeLimit.Load(); entrySizeLimit > 0 {
		txn.SetOption(kv.SizeLimits, kv.TxnSizeLimits{
			Entry: entrySizeLimit,
			Total: kv.TxnTotalSizeLimit.Load(),
		})
	}
}

type backfiller interface {
	BackfillData(ctx context.Context, handleRange reorgBackfillTask) (taskCtx backfillTaskContext, err error)
	AddMetricInfo(float64)
	GetCtx() *backfillCtx
	String() string
}

type backfillResult struct {
	taskID     int
	addedCount int
	scanCount  int
	totalCount int
	nextKey    kv.Key
	err        error
}

type reorgBackfillTask struct {
	physicalTable table.PhysicalTable

	// TODO: Remove the following fields after remove the function of run.
	id       int
	startKey kv.Key
	endKey   kv.Key
	jobID    int64
	priority int
}

func (r *reorgBackfillTask) getJobID() int64 {
	return r.jobID
}

func (r *reorgBackfillTask) String() string {
	pID := r.physicalTable.GetPhysicalID()
	start := hex.EncodeToString(r.startKey)
	end := hex.EncodeToString(r.endKey)
	jobID := r.getJobID()
	return fmt.Sprintf("taskID: %d, physicalTableID: %d, range: [%s, %s), jobID: %d", r.id, pID, start, end, jobID)
}

// mergeBackfillCtxToResult merge partial result in taskCtx into result.
func mergeBackfillCtxToResult(taskCtx *backfillTaskContext, result *backfillResult) {
	result.nextKey = taskCtx.nextKey
	result.addedCount += taskCtx.addedCount
	result.scanCount += taskCtx.scanCount
}

type backfillWorker struct {
	backfiller
	taskCh   chan *reorgBackfillTask
	resultCh chan *backfillResult
	ctx      context.Context
	cancel   func()
	wg       *sync.WaitGroup
}

func newBackfillWorker(ctx context.Context, bf backfiller) *backfillWorker {
	bfCtx, cancel := context.WithCancel(ctx)
	return &backfillWorker{
		backfiller: bf,
		taskCh:     make(chan *reorgBackfillTask, 1),
		resultCh:   make(chan *backfillResult, 1),
		ctx:        bfCtx,
		cancel:     cancel,
	}
}

func (w *backfillWorker) String() string {
	return fmt.Sprintf("backfill-worker %d, tp %s", w.GetCtx().id, w.backfiller.String())
}

func (w *backfillWorker) Close() {
	if w.cancel != nil {
		w.cancel()
		w.cancel = nil
	}
}

func closeBackfillWorkers(workers []*backfillWorker) {
	for _, worker := range workers {
		worker.Close()
	}
}

// ResultCounterForTest is used for test.
var ResultCounterForTest *atomic.Int32

// handleBackfillTask backfills range [task.startHandle, task.endHandle) handle's index to table.
func (w *backfillWorker) handleBackfillTask(d *ddlCtx, task *reorgBackfillTask, bf backfiller) *backfillResult {
	handleRange := *task
	result := &backfillResult{
		taskID:     task.id,
		err:        nil,
		addedCount: 0,
		nextKey:    handleRange.startKey,
	}
	lastLogCount := 0
	lastLogTime := time.Now()
	startTime := lastLogTime
	jobID := task.getJobID()
	rc := d.getReorgCtx(jobID)

	for {
		// Give job chance to be canceled or paused, if we not check it here,
		// we will never cancel the job once there is panic in bf.BackfillData.
		// Because reorgRecordTask may run a long time,
		// we should check whether this ddl job is still runnable.
		err := d.isReorgRunnable(d.ctx, false)
		if err != nil {
			result.err = err
			return result
		}

		taskCtx, err := bf.BackfillData(w.ctx, handleRange)
		if err != nil {
			result.err = err
			return result
		}

		bf.AddMetricInfo(float64(taskCtx.addedCount))
		mergeBackfillCtxToResult(&taskCtx, result)

		// Although `handleRange` is for data in one region, but back fill worker still split it into many
		// small reorg batch size slices and reorg them in many different kv txn.
		// If a task failed, it may contained some committed small kv txn which has already finished the
		// small range reorganization.
		// In the next round of reorganization, the target handle range may overlap with last committed
		// small ranges. This will cause the `redo` action in reorganization.
		// So for added count and warnings collection, it is recommended to collect the statistics in every
		// successfully committed small ranges rather than fetching it in the total result.
		rc.increaseRowCount(int64(taskCtx.addedCount))
		rc.mergeWarnings(taskCtx.warnings, taskCtx.warningsCount)

		if num := result.scanCount - lastLogCount; num >= 90000 {
			lastLogCount = result.scanCount
			logutil.DDLLogger().Info("backfill worker back fill index", zap.Stringer("worker", w),
				zap.Int("addedCount", result.addedCount), zap.Int("scanCount", result.scanCount),
				zap.String("next key", hex.EncodeToString(taskCtx.nextKey)),
				zap.Float64("speed(rows/s)", float64(num)/time.Since(lastLogTime).Seconds()))
			lastLogTime = time.Now()
		}

		handleRange.startKey = taskCtx.nextKey
		if taskCtx.done {
			break
		}
	}
	failpoint.InjectCall("afterHandleBackfillTask", task.jobID)

	logutil.DDLLogger().Info("backfill worker finish task",
		zap.Stringer("worker", w), zap.Stringer("task", task),
		zap.Int("added count", result.addedCount),
		zap.Int("scan count", result.scanCount),
		zap.String("next key", hex.EncodeToString(result.nextKey)),
		zap.Stringer("take time", time.Since(startTime)))
	if ResultCounterForTest != nil && result.err == nil {
		ResultCounterForTest.Add(1)
	}
	return result
}

func (w *backfillWorker) sendResult(result *backfillResult) {
	select {
	case <-w.ctx.Done():
	case w.resultCh <- result:
	}
}

func (w *backfillWorker) run(d *ddlCtx, bf backfiller, job *model.Job) {
	logger := logutil.DDLLogger().With(zap.Stringer("worker", w), zap.Int64("jobID", job.ID))
	var (
		curTaskID int
		task      *reorgBackfillTask
		ok        bool
	)

	defer w.wg.Done()
	defer util.Recover(metrics.LabelDDL, "backfillWorker.run", func() {
		w.sendResult(&backfillResult{taskID: curTaskID, err: dbterror.ErrReorgPanic})
	}, false)
	for {
		select {
		case <-w.ctx.Done():
			logger.Info("backfill worker exit on context done")
			return
		case task, ok = <-w.taskCh:
		}
		if !ok {
			logger.Info("backfill worker exit")
			return
		}
		curTaskID = task.id
		d.setDDLLabelForTopSQL(job.ID, job.Query)

		logger.Debug("backfill worker got task", zap.Int("workerID", w.GetCtx().id), zap.Stringer("task", task))
		failpoint.Inject("mockBackfillRunErr", func() {
			if w.GetCtx().id == 0 {
				result := &backfillResult{taskID: task.id, addedCount: 0, nextKey: nil, err: errors.Errorf("mock backfill error")}
				w.sendResult(result)
				failpoint.Continue()
			}
		})

		failpoint.Inject("mockHighLoadForAddIndex", func() {
			sqlPrefixes := []string{"alter"}
			topsql.MockHighCPULoad(job.Query, sqlPrefixes, 5)
		})

		failpoint.Inject("mockBackfillSlow", func() {
			time.Sleep(100 * time.Millisecond)
		})

		// Change the batch size dynamically.
		currentBatchCnt := w.GetCtx().batchCnt
		targetBatchSize := job.ReorgMeta.GetBatchSize()
		if targetBatchSize != currentBatchCnt {
			w.GetCtx().batchCnt = targetBatchSize
			logger.Info("adjust ddl job config success",
				zap.Int64("jobID", job.ID),
				zap.Int("current batch size", w.GetCtx().batchCnt))
		}
		result := w.handleBackfillTask(d, task, bf)
		w.sendResult(result)

		if result.err != nil {
			logger.Info("backfill worker exit on error",
				zap.Error(result.err))
			return
		}
	}
}

// loadTableRanges load table key ranges from PD between given start key and end key.
// It returns up to `limit` ranges.
func loadTableRanges(
	ctx context.Context,
	t table.PhysicalTable,
	store kv.Storage,
	startKey, endKey kv.Key,
	splitKeys []kv.Key,
	limit int,
) ([]kv.KeyRange, error) {
	if len(startKey) == 0 && len(endKey) == 0 {
		logutil.DDLLogger().Info("load noop table range",
			zap.Int64("physicalTableID", t.GetPhysicalID()))
		return []kv.KeyRange{}, nil
	}

	s, ok := store.(tikv.Storage)
	if !ok {
		// Only support split ranges in tikv.Storage now.
		logutil.DDLLogger().Info("load table ranges failed, unsupported storage",
			zap.String("storage", fmt.Sprintf("%T", store)),
			zap.Int64("physicalTableID", t.GetPhysicalID()))
		return []kv.KeyRange{{StartKey: startKey, EndKey: endKey}}, nil
	}
	failpoint.Inject("setLimitForLoadTableRanges", func(val failpoint.Value) {
		if v, ok := val.(int); ok {
			limit = v
		}
	})

	rc := s.GetRegionCache()
	maxSleep := 10000 // ms
	bo := tikv.NewBackofferWithVars(ctx, maxSleep, nil)
	var ranges []kv.KeyRange
	maxRetryTimes := util.DefaultMaxRetries
	failpoint.Inject("loadTableRangesNoRetry", func() {
		maxRetryTimes = 1
	})
	err := util.RunWithRetry(maxRetryTimes, util.RetryInterval, func() (bool, error) {
		logutil.DDLLogger().Info("load table ranges from PD",
			zap.Int64("physicalTableID", t.GetPhysicalID()),
			zap.String("start key", hex.EncodeToString(startKey)),
			zap.String("end key", hex.EncodeToString(endKey)))
		rs, err := rc.BatchLoadRegionsWithKeyRange(bo, startKey, endKey, limit)
		if err != nil {
			return false, errors.Trace(err)
		}
		var mockErr bool
		failpoint.InjectCall("beforeLoadRangeFromPD", &mockErr)
		if mockErr {
			return false, kv.ErrTxnRetryable
		}

		ranges = make([]kv.KeyRange, 0, len(rs))
		for _, r := range rs {
			ranges = append(ranges, kv.KeyRange{StartKey: r.StartKey(), EndKey: r.EndKey()})
		}
		err = validateAndFillRanges(ranges, startKey, endKey)
		if err != nil {
			return true, errors.Trace(err)
		}
		return false, nil
	})
	if err != nil {
		return nil, errors.Trace(err)
	}
	ranges = splitRangesByKeys(ranges, splitKeys)
	logutil.DDLLogger().Info("load table ranges from PD done",
		zap.Int64("physicalTableID", t.GetPhysicalID()),
		zap.String("range start", hex.EncodeToString(ranges[0].StartKey)),
		zap.String("range end", hex.EncodeToString(ranges[len(ranges)-1].EndKey)),
		zap.Int("range count", len(ranges)))
	failpoint.InjectCall("afterLoadTableRanges", len(ranges))
	return ranges, nil
}

// splitRangesByKeys splits the ranges into more ranges by given split keys.
// The split keys should be ordered.
func splitRangesByKeys(ranges []kv.KeyRange, splitKeys []kv.Key) []kv.KeyRange {
	if len(splitKeys) == 0 {
		return ranges
	}
	ret := make([]kv.KeyRange, 0, len(ranges)+len(splitKeys))
	for _, r := range ranges {
		start := r.StartKey
		finishOneRange := false
		for !finishOneRange {
			if len(splitKeys) == 0 {
				break
			}
			split := splitKeys[0]
			switch {
			case split.Cmp(start) <= 0:
				splitKeys = splitKeys[1:]
			case split.Cmp(r.EndKey) < 0:
				splitKeys = splitKeys[1:]
				ret = append(ret, kv.KeyRange{StartKey: start, EndKey: split})
				start = split
			default:
				finishOneRange = true
			}
		}
		ret = append(ret, kv.KeyRange{StartKey: start, EndKey: r.EndKey})
	}
	return ret
}

func validateAndFillRanges(ranges []kv.KeyRange, startKey, endKey []byte) error {
	failpoint.Inject("validateAndFillRangesErr", func() {
		failpoint.Return(dbterror.ErrInvalidSplitRegionRanges.GenWithStackByArgs("mock"))
	})
	if len(ranges) == 0 {
		errMsg := fmt.Sprintf("cannot find region in range [%s, %s]",
			hex.EncodeToString(startKey), hex.EncodeToString(endKey))
		return dbterror.ErrInvalidSplitRegionRanges.GenWithStackByArgs(errMsg)
	}
	for i, r := range ranges {
		if i == 0 {
			s := r.StartKey
			if len(s) == 0 || bytes.Compare(s, startKey) < 0 {
				ranges[i].StartKey = startKey
			} else if bytes.Compare(s, startKey) > 0 {
				errMsg := fmt.Sprintf("get empty range at the beginning of ranges, expected %s, but got %s",
					hex.EncodeToString(startKey), hex.EncodeToString(s))
				return dbterror.ErrInvalidSplitRegionRanges.GenWithStackByArgs(errMsg)
			}
		}
		if i == len(ranges)-1 {
			e := r.EndKey
			if len(e) == 0 || bytes.Compare(e, endKey) > 0 {
				ranges[i].EndKey = endKey
			}
			// We don't need to check the end key because a limit may set before scanning regions.
		}
		if len(ranges[i].StartKey) == 0 || len(ranges[i].EndKey) == 0 {
			return dbterror.ErrInvalidSplitRegionRanges.GenWithStackByArgs("get empty start/end key in the middle of ranges")
		}
		if i > 0 && !bytes.Equal(ranges[i-1].EndKey, ranges[i].StartKey) {
			errMsg := fmt.Sprintf("ranges are not continuous, last end key %s, next start key %s",
				hex.EncodeToString(ranges[i-1].EndKey), hex.EncodeToString(ranges[i].StartKey))
			return dbterror.ErrInvalidSplitRegionRanges.GenWithStackByArgs(errMsg)
		}
	}
	return nil
}

func getBatchTasks(
	t table.Table,
	reorgInfo *reorgInfo,
	kvRanges []kv.KeyRange,
	taskIDAlloc *taskIDAllocator,
	bfWorkerTp backfillerType,
) []*reorgBackfillTask {
	batchTasks := make([]*reorgBackfillTask, 0, len(kvRanges))
	//nolint:forcetypeassert
	phyTbl := t.(table.PhysicalTable)
	for _, r := range kvRanges {
		taskID := taskIDAlloc.alloc()
		startKey := r.StartKey
		endKey := r.EndKey
		endKey = getActualEndKey(t, reorgInfo, bfWorkerTp, startKey, endKey, taskID)
		task := &reorgBackfillTask{
			id:            taskID,
			jobID:         reorgInfo.Job.ID,
			physicalTable: phyTbl,
			priority:      reorgInfo.Priority,
			startKey:      startKey,
			endKey:        endKey,
		}
		batchTasks = append(batchTasks, task)
	}
	return batchTasks
}

func getActualEndKey(
	t table.Table,
	reorgInfo *reorgInfo,
	bfTp backfillerType,
	rangeStart, rangeEnd kv.Key,
	taskID int,
) kv.Key {
	job := reorgInfo.Job
	//nolint:forcetypeassert
	phyTbl := t.(table.PhysicalTable)

	if bfTp == typeAddIndexMergeTmpWorker {
		// Temp Index data does not grow infinitely, we can return the whole range
		// and IndexMergeTmpWorker should still be finished in a bounded time.
		return rangeEnd
	}
	if bfTp == typeAddIndexWorker && job.ReorgMeta.ReorgTp == model.ReorgTypeLitMerge {
		// Ingest worker uses coprocessor to read table data. It is fast enough,
		// we don't need to get the actual end key of this range.
		return rangeEnd
	}

	// Otherwise to avoid the future data written to key range of [backfillChunkEndKey, rangeEnd) and
	// backfill worker can't catch up, we shrink the end key to the actual written key for now.
	jobCtx := reorgInfo.NewJobContext()

	actualEndKey, err := GetRangeEndKey(jobCtx, reorgInfo.jobCtx.store, job.Priority, t.RecordPrefix(), rangeStart, rangeEnd)
	if err != nil {
		logutil.DDLLogger().Info("get backfill range task, get reverse key failed", zap.Error(err))
		return rangeEnd
	}
	logutil.DDLLogger().Info("get backfill range task, change end key",
		zap.Int("id", taskID),
		zap.Int64("pTbl", phyTbl.GetPhysicalID()),
		zap.String("end key", hex.EncodeToString(rangeEnd)),
		zap.String("current end key", hex.EncodeToString(actualEndKey)))
	return actualEndKey
}

// sendTasks sends tasks to workers, and returns remaining kvRanges that is not handled.
func sendTasks(
	exec backfillExecutor,
	t table.PhysicalTable,
	kvRanges []kv.KeyRange,
	reorgInfo *reorgInfo,
	taskIDAlloc *taskIDAllocator,
	bfWorkerTp backfillerType,
) error {
	batchTasks := getBatchTasks(t, reorgInfo, kvRanges, taskIDAlloc, bfWorkerTp)
	for _, task := range batchTasks {
		if err := exec.sendTask(task); err != nil {
			return errors.Trace(err)
		}
	}
	return nil
}

func makeupDecodeColMap(dbName ast.CIStr, t table.Table) (map[int64]decoder.Column, error) {
	writableColInfos := make([]*model.ColumnInfo, 0, len(t.WritableCols()))
	for _, col := range t.WritableCols() {
		writableColInfos = append(writableColInfos, col.ColumnInfo)
	}
	exprCols, _, err := expression.ColumnInfos2ColumnsAndNames(newReorgExprCtx(), dbName, t.Meta().Name, writableColInfos, t.Meta())
	if err != nil {
		return nil, err
	}
	mockSchema := expression.NewSchema(exprCols...)

	decodeColMap := decoder.BuildFullDecodeColMap(t.WritableCols(), mockSchema)

	return decodeColMap, nil
}

const backfillTaskChanSize = 128

func (dc *ddlCtx) addIndexWithLocalIngest(
	ctx context.Context,
	sessPool *sess.Pool,
	t table.PhysicalTable,
	reorgInfo *reorgInfo,
) error {
	if err := dc.isReorgRunnable(ctx, false); err != nil {
		return errors.Trace(err)
	}
	job := reorgInfo.Job
	opCtx, cancel := NewLocalOperatorCtx(ctx, job.ID)
	defer cancel()

	idxCnt := len(reorgInfo.elements)
	indexIDs := make([]int64, 0, idxCnt)
	indexInfos := make([]*model.IndexInfo, 0, idxCnt)
	var indexNames strings.Builder
	uniques := make([]bool, 0, idxCnt)
	hasUnique := false
	for _, e := range reorgInfo.elements {
		indexIDs = append(indexIDs, e.ID)
		indexInfo := model.FindIndexInfoByID(t.Meta().Indices, e.ID)
		if indexInfo == nil {
			logutil.DDLIngestLogger().Warn("index info not found",
				zap.Int64("jobID", job.ID),
				zap.Int64("tableID", t.Meta().ID),
				zap.Int64("indexID", e.ID))
			return errors.Errorf("index info not found: %d", e.ID)
		}
		indexInfos = append(indexInfos, indexInfo)
		if indexNames.Len() > 0 {
			indexNames.WriteString("+")
		}
		indexNames.WriteString(indexInfo.Name.O)
		uniques = append(uniques, indexInfo.Unique)
		hasUnique = hasUnique || indexInfo.Unique
	}

	var (
		cfg *local.BackendConfig
		bd  *local.Backend
		err error
	)
	if config.GetGlobalConfig().Store == config.StoreTypeTiKV {
		cfg, bd, err = ingest.CreateLocalBackend(ctx, dc.store, job, false, 0)
		if err != nil {
			return errors.Trace(err)
		}
		defer bd.Close()
	}
	bcCtx, err := ingest.NewBackendCtxBuilder(ctx, dc.store, job).
		WithCheckpointManagerParam(sessPool, reorgInfo.PhysicalTableID).
		Build(cfg, bd)
	if err != nil {
		return errors.Trace(err)
	}
	defer bcCtx.Close()

	reorgCtx := dc.getReorgCtx(job.ID)
	rowCntListener := &localRowCntCollector{
		prevPhysicalRowCnt: reorgCtx.getRowCount(),
		reorgCtx:           reorgCtx,
		counter:            metrics.GetBackfillTotalByLabel(metrics.LblAddIdxRate, job.SchemaName, job.TableName, indexNames.String()),
	}

	sctx, err := sessPool.Get()
	if err != nil {
		return errors.Trace(err)
	}
	defer sessPool.Put(sctx)
	avgRowSize := estimateTableRowSize(ctx, dc.store, sctx.GetRestrictedSQLExecutor(), t)

	engines, err := bcCtx.Register(indexIDs, uniques, t)
	if err != nil {
		logutil.DDLIngestLogger().Error("cannot register new engine",
			zap.Int64("jobID", job.ID),
			zap.Error(err),
			zap.Int64s("index IDs", indexIDs))
		return errors.Trace(err)
	}
	importConc := job.ReorgMeta.GetConcurrency()
	pipe, err := NewAddIndexIngestPipeline(
		opCtx,
		dc.store,
		sessPool,
		bcCtx,
		engines,
		job.ID,
		t,
		indexInfos,
		reorgInfo.StartKey,
		reorgInfo.EndKey,
		job.ReorgMeta,
		avgRowSize,
		importConc,
		rowCntListener,
	)
	if err != nil {
		return err
	}
	err = executeAndClosePipeline(opCtx, pipe, job, bcCtx, avgRowSize)
	if err != nil {
		err1 := bcCtx.FinishAndUnregisterEngines(ingest.OptCloseEngines)
		if err1 != nil {
			logutil.DDLIngestLogger().Error("unregister engine failed",
				zap.Int64("jobID", job.ID),
				zap.Error(err1),
				zap.Int64s("index IDs", indexIDs))
		}
		return err
	}
	return bcCtx.FinishAndUnregisterEngines(ingest.OptCleanData | ingest.OptCheckDup)
}

func adjustWorkerCntAndMaxWriteSpeed(ctx context.Context, pipe *operator.AsyncPipeline, job *model.Job, bcCtx ingest.BackendCtx, avgRowSize int) {
	reader, writer := pipe.GetReaderAndWriter()
	if reader == nil || writer == nil {
		logutil.DDLIngestLogger().Error("failed to get local ingest mode reader or writer", zap.Int64("jobID", job.ID))
		return
	}
	ticker := time.NewTicker(UpdateDDLJobReorgCfgInterval)
	defer ticker.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case <-ticker.C:
			failpoint.InjectCall("onUpdateJobParam")
			maxWriteSpeed := job.ReorgMeta.GetMaxWriteSpeed()
			if maxWriteSpeed != bcCtx.GetLocalBackend().GetWriteSpeedLimit() {
				bcCtx.GetLocalBackend().UpdateWriteSpeedLimit(maxWriteSpeed)
				logutil.DDLIngestLogger().Info("adjust ddl job config success",
					zap.Int64("jobID", job.ID),
					zap.Int("max write speed", bcCtx.GetLocalBackend().GetWriteSpeedLimit()))
			}

			concurrency := job.ReorgMeta.GetConcurrency()
			targetReaderCnt, targetWriterCnt := expectedIngestWorkerCnt(concurrency, avgRowSize)
			currentReaderCnt, currentWriterCnt := reader.GetWorkerPoolSize(), writer.GetWorkerPoolSize()
			if int32(targetReaderCnt) != currentReaderCnt || int32(targetWriterCnt) != currentWriterCnt {
				reader.TuneWorkerPoolSize(int32(targetReaderCnt), false)
				writer.TuneWorkerPoolSize(int32(targetWriterCnt), false)
				logutil.DDLIngestLogger().Info("adjust ddl job config success",
					zap.Int64("jobID", job.ID),
					zap.Int32("table scan operator count", reader.GetWorkerPoolSize()),
					zap.Int32("index ingest operator count", writer.GetWorkerPoolSize()))
			}
		}
	}
}

func executeAndClosePipeline(ctx *OperatorCtx, pipe *operator.AsyncPipeline, job *model.Job, bcCtx ingest.BackendCtx, avgRowSize int) error {
	err := pipe.Execute()
	if err != nil {
		return err
	}

	// Adjust worker pool size and max write speed dynamically.
	var wg util.WaitGroupWrapper
	adjustCtx, cancel := context.WithCancel(ctx)
	if job != nil {
		wg.RunWithLog(func() {
			adjustWorkerCntAndMaxWriteSpeed(adjustCtx, pipe, job, bcCtx, avgRowSize)
		})
	}

	err = pipe.Close()
	failpoint.InjectCall("afterPipeLineClose", pipe)
	cancel()
	wg.Wait() // wait for adjustWorkerCntAndMaxWriteSpeed to exit
	if opErr := ctx.OperatorErr(); opErr != nil {
		return opErr
	}
	return err
}

type localRowCntCollector struct {
	reorgCtx *reorgCtx
	counter  prometheus.Counter

	// prevPhysicalRowCnt records the row count from previous physical tables (partitions).
	prevPhysicalRowCnt int64
	// curPhysicalRowCnt records the row count of current physical table.
	curPhysicalRowCnt struct {
		cnt int64
		mu  sync.Mutex
	}
}

func (s *localRowCntCollector) Add(_, rowCnt int64) {
	s.curPhysicalRowCnt.mu.Lock()
	s.curPhysicalRowCnt.cnt += rowCnt
	s.reorgCtx.setRowCount(s.prevPhysicalRowCnt + s.curPhysicalRowCnt.cnt)
	s.curPhysicalRowCnt.mu.Unlock()
	s.counter.Add(float64(rowCnt))
}

func (s *localRowCntCollector) SetTotal(total int) {
	s.reorgCtx.setRowCount(s.prevPhysicalRowCnt + int64(total))
}

// UpdateDDLJobReorgCfgInterval is the interval to check and update reorg configuration.
var UpdateDDLJobReorgCfgInterval = 2 * time.Second

// writePhysicalTableRecord handles the "add index" or "modify/change column" reorganization state for a non-partitioned table or a partition.
// For a partitioned table, it should be handled partition by partition.
//
// How to "add index" or "update column value" in reorganization state?
// Concurrently process the @@tidb_ddl_reorg_worker_cnt tasks. Each task deals with a handle range of the index/row record.
// The handle range is split from PD regions now. Each worker deal with a region table key range one time.
// Each handle range by estimation, concurrent processing needs to perform after the handle range has been acquired.
// The operation flow is as follows:
//  1. Open numbers of defaultWorkers goroutines.
//  2. Split table key range from PD regions.
//  3. Send tasks to running workers by workers's task channel. Each task deals with a region key ranges.
//  4. Wait all these running tasks finished, then continue to step 3, until all tasks is done.
//
// The above operations are completed in a transaction.
// Finally, update the concurrent processing of the total number of rows, and store the completed handle value.
func (dc *ddlCtx) writePhysicalTableRecord(
	ctx context.Context,
	sessPool *sess.Pool,
	t table.PhysicalTable,
	bfWorkerType backfillerType,
	reorgInfo *reorgInfo,
) (err error) {
	startKey, endKey := reorgInfo.StartKey, reorgInfo.EndKey

	if err := dc.isReorgRunnable(ctx, false); err != nil {
		return errors.Trace(err)
	}
	defer func() {
		if err != nil && ctx.Err() != nil {
			err = context.Cause(ctx)
		}
	}()

	failpoint.Inject("MockCaseWhenParseFailure", func(val failpoint.Value) {
		//nolint:forcetypeassert
		if val.(bool) {
			failpoint.Return(errors.New("job.ErrCount:" + strconv.Itoa(int(reorgInfo.Job.ErrorCount)) + ", mock unknown type: ast.whenClause."))
		}
	})
	if bfWorkerType == typeAddIndexWorker && reorgInfo.ReorgMeta.ReorgTp == model.ReorgTypeLitMerge {
		return dc.addIndexWithLocalIngest(ctx, sessPool, t, reorgInfo)
	}

	jc := reorgInfo.NewJobContext()

	eg, egCtx := util.NewErrorGroupWithRecoverWithCtx(ctx)

	exec, err := newTxnBackfillExecutor(egCtx, reorgInfo, sessPool, bfWorkerType, t, jc)
	if err != nil {
		return errors.Trace(err)
	}
	defer exec.close(true)

	err = exec.setupWorkers()
	if err != nil {
		return errors.Trace(err)
	}

	var splitKeys []kv.Key
	if reorgInfo.mergingTmpIdx {
		splitKeys = getSplitKeysForTempIndexRanges(t.GetPhysicalID(), reorgInfo.elements)
	}

	// process result goroutine
	eg.Go(func() error {
		totalAddedCount := reorgInfo.Job.GetRowCount()
		keeper := newDoneTaskKeeper(startKey)
		cnt := 0

		for {
			select {
			case <-egCtx.Done():
				return egCtx.Err()
			case result, ok := <-exec.resultChan():
				if !ok {
					logutil.DDLLogger().Info("backfill workers successfully processed",
						zap.Stringer("element", reorgInfo.currElement),
						zap.Int64("total added count", totalAddedCount),
						zap.String("start key", hex.EncodeToString(startKey)))
					return nil
				}
				cnt++

				if result.err != nil {
					logutil.DDLLogger().Warn("backfill worker failed",
						zap.Int64("job ID", reorgInfo.ID),
						zap.Int64("total added count", totalAddedCount),
						zap.String("start key", hex.EncodeToString(startKey)),
						zap.String("result next key", hex.EncodeToString(result.nextKey)),
						zap.Error(result.err))
					return result.err
				}

				if result.totalCount > 0 {
					totalAddedCount = int64(result.totalCount)
				} else {
					totalAddedCount += int64(result.addedCount)
				}

				keeper.updateNextKey(result.taskID, result.nextKey)

				if cnt%(exec.currentWorkerSize()*4) == 0 {
					err2 := reorgInfo.UpdateReorgMeta(keeper.nextKey, sessPool)
					if err2 != nil {
						logutil.DDLLogger().Warn("update reorg meta failed",
							zap.Int64("job ID", reorgInfo.ID),
							zap.Error(err2))
					}
					failpoint.InjectCall("afterUpdateReorgMeta")
				}
			}
		}
	})

	// generate task goroutine
	doneCh := make(chan struct{})
	eg.Go(func() error {
		// we will modify the startKey in this goroutine, so copy them to avoid race.
		start, end := startKey, endKey
		taskIDAlloc := newTaskIDAllocator()
		for {
			kvRanges, err2 := loadTableRanges(egCtx, t, dc.store, start, end, splitKeys, backfillTaskChanSize)
			if err2 != nil {
				return errors.Trace(err2)
			}
			if len(kvRanges) == 0 {
				break
			}
			logutil.DDLLogger().Info("start backfill workers to reorg record",
				zap.Stringer("type", bfWorkerType),
				zap.Int("workerCnt", exec.currentWorkerSize()),
				zap.Int("regionCnt", len(kvRanges)),
				zap.String("startKey", hex.EncodeToString(start)),
				zap.String("endKey", hex.EncodeToString(end)))

			err2 = sendTasks(exec, t, kvRanges, reorgInfo, taskIDAlloc, bfWorkerType)
			if err2 != nil {
				return errors.Trace(err2)
			}

			start = kvRanges[len(kvRanges)-1].EndKey
			if start.Cmp(end) >= 0 {
				break
			}
		}

		exec.close(false)
		close(doneCh)
		return nil
	})

	// update the worker cnt goroutine
	eg.Go(func() error {
		ticker := time.NewTicker(UpdateDDLJobReorgCfgInterval)
		defer ticker.Stop()
	outer:
		for {
			select {
			case <-egCtx.Done():
				return egCtx.Err()
			case <-doneCh:
				break outer
			case <-ticker.C:
				currentWorkerCnt := exec.currentWorkerSize()
				targetWorkerCnt := reorgInfo.ReorgMeta.GetConcurrency()
				if currentWorkerCnt != targetWorkerCnt {
					err := exec.adjustWorkerSize()
					if err != nil {
						logutil.DDLLogger().Error("adjust ddl job config failed",
							zap.Error(err))
					} else {
						logutil.DDLLogger().Info("adjust ddl job config success",
							zap.Int("current worker count", exec.currentWorkerSize()))
					}
				}
			}
		}
		return nil
	})

	return eg.Wait()
}

// recordIterFunc is used for low-level record iteration.
type recordIterFunc func(h kv.Handle, rowKey kv.Key, rawRecord []byte) (more bool, err error)

func iterateSnapshotKeys(ctx *ReorgContext, store kv.Storage, priority int, keyPrefix kv.Key, version uint64,
	startKey kv.Key, endKey kv.Key, fn recordIterFunc) error {
	isRecord := tablecodec.IsRecordKey(keyPrefix.Next())
	var firstKey kv.Key
	if startKey == nil {
		firstKey = keyPrefix
	} else {
		firstKey = startKey
	}

	var upperBound kv.Key
	if endKey == nil {
		upperBound = keyPrefix.PrefixNext()
	} else {
		upperBound = endKey.PrefixNext()
	}

	ver := kv.Version{Ver: version}
	snap := store.GetSnapshot(ver)
	snap.SetOption(kv.Priority, priority)
	snap.SetOption(kv.RequestSourceInternal, true)
	snap.SetOption(kv.RequestSourceType, ctx.ddlJobSourceType())
	snap.SetOption(kv.ExplicitRequestSourceType, kvutil.ExplicitTypeDDL)
	if tagger := ctx.getResourceGroupTaggerForTopSQL(); tagger != nil {
		snap.SetOption(kv.ResourceGroupTagger, tagger)
	}
	snap.SetOption(kv.ResourceGroupName, ctx.resourceGroupName)

	it, err := snap.Iter(firstKey, upperBound)
	if err != nil {
		return errors.Trace(err)
	}
	defer it.Close()

	for it.Valid() {
		if !it.Key().HasPrefix(keyPrefix) {
			break
		}

		var handle kv.Handle
		if isRecord {
			handle, err = tablecodec.DecodeRowKey(it.Key())
			if err != nil {
				return errors.Trace(err)
			}
		}

		more, err := fn(handle, it.Key(), it.Value())
		if !more || err != nil {
			return errors.Trace(err)
		}

		err = kv.NextUntil(it, util.RowKeyPrefixFilter(it.Key()))
		if err != nil {
			if kv.ErrNotExist.Equal(err) {
				break
			}
			return errors.Trace(err)
		}
	}

	return nil
}

// GetRangeEndKey gets the actual end key for the range of [startKey, endKey).
func GetRangeEndKey(ctx *ReorgContext, store kv.Storage, priority int, keyPrefix kv.Key, startKey, endKey kv.Key) (kv.Key, error) {
	snap := store.GetSnapshot(kv.MaxVersion)
	snap.SetOption(kv.Priority, priority)
	if tagger := ctx.getResourceGroupTaggerForTopSQL(); tagger != nil {
		snap.SetOption(kv.ResourceGroupTagger, tagger)
	}
	snap.SetOption(kv.ResourceGroupName, ctx.resourceGroupName)
	snap.SetOption(kv.RequestSourceInternal, true)
	snap.SetOption(kv.RequestSourceType, ctx.ddlJobSourceType())
	snap.SetOption(kv.ExplicitRequestSourceType, kvutil.ExplicitTypeDDL)
	it, err := snap.IterReverse(endKey, nil)
	if err != nil {
		return nil, errors.Trace(err)
	}
	defer it.Close()

	if !it.Valid() || !it.Key().HasPrefix(keyPrefix) {
		return startKey.Next(), nil
	}
	if it.Key().Cmp(startKey) < 0 {
		return startKey.Next(), nil
	}

	return it.Key().Next(), nil
}

func mergeWarningsAndWarningsCount(partWarnings, totalWarnings map[errors.ErrorID]*terror.Error, partWarningsCount, totalWarningsCount map[errors.ErrorID]int64) (map[errors.ErrorID]*terror.Error, map[errors.ErrorID]int64) {
	for _, warn := range partWarnings {
		if _, ok := totalWarningsCount[warn.ID()]; ok {
			totalWarningsCount[warn.ID()] += partWarningsCount[warn.ID()]
		} else {
			totalWarningsCount[warn.ID()] = partWarningsCount[warn.ID()]
			totalWarnings[warn.ID()] = warn
		}
	}
	return totalWarnings, totalWarningsCount
}

func logSlowOperations(elapsed time.Duration, slowMsg string, threshold uint32) {
	if threshold == 0 {
		threshold = atomic.LoadUint32(&vardef.DDLSlowOprThreshold)
	}

	if elapsed >= time.Duration(threshold)*time.Millisecond {
		logutil.DDLLogger().Info("slow operations",
			zap.Duration("takeTimes", elapsed),
			zap.String("msg", slowMsg))
	}
}

// doneTaskKeeper keeps the done tasks and update the latest next key.
type doneTaskKeeper struct {
	doneTaskNextKey map[int]kv.Key
	current         int
	nextKey         kv.Key
}

func newDoneTaskKeeper(start kv.Key) *doneTaskKeeper {
	return &doneTaskKeeper{
		doneTaskNextKey: make(map[int]kv.Key),
		current:         0,
		nextKey:         start,
	}
}

func (n *doneTaskKeeper) updateNextKey(doneTaskID int, next kv.Key) {
	if doneTaskID == n.current {
		n.current++
		n.nextKey = next
		for {
			nKey, ok := n.doneTaskNextKey[n.current]
			if !ok {
				break
			}
			delete(n.doneTaskNextKey, n.current)
			n.current++
			n.nextKey = nKey
		}
		return
	}
	n.doneTaskNextKey[doneTaskID] = next
}
