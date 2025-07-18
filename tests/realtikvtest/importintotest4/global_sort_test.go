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

package importintotest

import (
	"context"
	"encoding/json"
	"fmt"
	"net/url"
	"slices"
	"strconv"
	"testing"
	"time"

	"github.com/fsouza/fake-gcs-server/fakestorage"
	"github.com/pingcap/tidb/pkg/disttask/framework/proto"
	"github.com/pingcap/tidb/pkg/disttask/framework/storage"
	"github.com/pingcap/tidb/pkg/disttask/importinto"
	"github.com/pingcap/tidb/pkg/executor/importer"
	"github.com/pingcap/tidb/pkg/testkit"
	"github.com/pingcap/tidb/pkg/testkit/testfailpoint"
	"github.com/pingcap/tidb/tests/realtikvtest/testutils"
	"github.com/stretchr/testify/require"
	"github.com/tikv/client-go/v2/util"
)

func urlEqual(t *testing.T, expected, actual string) {
	urlExpected, err := url.Parse(expected)
	require.NoError(t, err)
	urlGot, err := url.Parse(actual)
	require.NoError(t, err)
	// order of query parameters might change
	require.Equal(t, urlExpected.Query(), urlGot.Query())
	urlExpected.RawQuery, urlGot.RawQuery = "", ""
	require.Equal(t, urlExpected.String(), urlGot.String())
}

func checkExternalFields(t *testing.T, tk *testkit.TestKit) {
	// fetch subtask meta from tk, and check fields with `external:"true"` tag
	rs := tk.MustQuery("select meta, step from mysql.tidb_background_subtask_history").Rows()
	for _, r := range rs {
		// convert string to int64
		step, err := strconv.Atoi(r[1].(string))
		require.NoError(t, err)
		switch proto.Step(step) {
		case proto.ImportStepEncodeAndSort:
			var subtaskMeta importinto.ImportStepMeta
			require.NoError(t, json.Unmarshal([]byte(r[0].(string)), &subtaskMeta))
			testutils.AssertExternalField(t, &subtaskMeta)
		case proto.ImportStepMergeSort:
			var subtaskMeta importinto.MergeSortStepMeta
			require.NoError(t, json.Unmarshal([]byte(r[0].(string)), &subtaskMeta))
			testutils.AssertExternalField(t, &subtaskMeta)
		case proto.ImportStepWriteAndIngest:
			var subtaskMeta importinto.WriteIngestStepMeta
			require.NoError(t, json.Unmarshal([]byte(r[0].(string)), &subtaskMeta))
			testutils.AssertExternalField(t, &subtaskMeta)
		}
	}
}

func (s *mockGCSSuite) TestGlobalSortBasic() {
	ctx := context.Background()
	ctx = util.WithInternalSourceType(ctx, "taskManager")
	s.server.CreateObject(fakestorage.Object{
		ObjectAttrs: fakestorage.ObjectAttrs{BucketName: "gs-basic", Name: "t.1.csv"},
		Content:     []byte("1,foo1,bar1,123\n2,foo2,bar2,456\n3,foo3,bar3,789\n"),
	})
	s.server.CreateObject(fakestorage.Object{
		ObjectAttrs: fakestorage.ObjectAttrs{BucketName: "gs-basic", Name: "t.2.csv"},
		Content:     []byte("4,foo4,bar4,123\n5,foo5,bar5,223\n6,foo6,bar6,323\n"),
	})
	s.server.CreateBucketWithOpts(fakestorage.CreateBucketOpts{Name: "sorted"})
	s.prepareAndUseDB("gsort_basic")
	s.tk.MustExec(`create table t (a bigint primary key, b varchar(100), c varchar(100), d int,
		key(a), key(c,d), key(d));`)
	testfailpoint.Enable(s.T(), "github.com/pingcap/tidb/pkg/parser/ast/forceRedactURL", "return(true)")
	ch := make(chan struct{}, 1)
	testfailpoint.EnableCall(s.T(), "github.com/pingcap/tidb/pkg/disttask/framework/scheduler/WaitCleanUpFinished", func() {
		ch <- struct{}{}
	})

	sortStorageURI := fmt.Sprintf("gs://sorted/import?endpoint=%s&access-key=aaaaaa&secret-access-key=bbbbbb", gcsEndpoint)
	importSQL := fmt.Sprintf(`import into t FROM 'gs://gs-basic/t.*.csv?endpoint=%s'
		with __max_engine_size = '1', cloud_storage_uri='%s'`, gcsEndpoint, sortStorageURI)
	result := s.tk.MustQuery(importSQL).Rows()
	s.Len(result, 1)
	jobID, err := strconv.Atoi(result[0][0].(string))
	s.NoError(err)
	s.tk.MustQuery("select * from t").Sort().Check(testkit.Rows(
		"1 foo1 bar1 123", "2 foo2 bar2 456", "3 foo3 bar3 789",
		"4 foo4 bar4 123", "5 foo5 bar5 223", "6 foo6 bar6 323",
	))

	// check all sorted data cleaned up
	<-ch

	_, files, err := s.server.ListObjectsWithOptions("sorted", fakestorage.ListOptions{Prefix: "import"})
	s.NoError(err)
	s.Len(files, 0)
	// check sensitive info is redacted
	jobInfo, err := importer.GetJob(context.Background(), s.tk.Session(), int64(jobID), "", true)
	s.NoError(err)
	redactedSortStorageURI := fmt.Sprintf("gs://sorted/import?endpoint=%s&access-key=xxxxxx&secret-access-key=xxxxxx", gcsEndpoint)
	urlEqual(s.T(), redactedSortStorageURI, jobInfo.Parameters.Options["cloud_storage_uri"].(string))
	s.EqualValues(6, jobInfo.Summary.ImportedRows)
	taskManager, err := storage.GetTaskManager()
	s.NoError(err)
	taskKey := importinto.TaskKey(int64(jobID))
	task, err2 := taskManager.GetTaskByKeyWithHistory(ctx, taskKey)
	s.NoError(err2)
	taskMeta := importinto.TaskMeta{}
	s.NoError(json.Unmarshal(task.Meta, &taskMeta))
	urlEqual(s.T(), redactedSortStorageURI, taskMeta.Plan.CloudStorageURI)
	require.True(s.T(), taskMeta.Plan.DisableTiKVImportMode)

	// merge-sort data kv
	s.tk.MustExec("truncate table t")
	result = s.tk.MustQuery(importSQL + `, __force_merge_step`).Rows()
	s.Len(result, 1)
	s.tk.MustQuery("select * from t").Sort().Check(testkit.Rows(
		"1 foo1 bar1 123", "2 foo2 bar2 456", "3 foo3 bar3 789",
		"4 foo4 bar4 123", "5 foo5 bar5 223", "6 foo6 bar6 323",
	))
	<-ch

	// failed task, should clean up all sorted data too.
	testfailpoint.Enable(s.T(), "github.com/pingcap/tidb/pkg/disttask/importinto/failWhenDispatchWriteIngestSubtask", "return(true)")
	s.tk.MustExec("truncate table t")
	result = s.tk.MustQuery(importSQL + ", detached").Rows()
	s.Len(result, 1)
	jobID, err = strconv.Atoi(result[0][0].(string))
	s.NoError(err)
	s.Eventually(func() bool {
		task, err2 = taskManager.GetTaskByKeyWithHistory(ctx, importinto.TaskKey(int64(jobID)))
		s.NoError(err2)
		return task.State == proto.TaskStateReverted
	}, 30*time.Second, 300*time.Millisecond)
	// check all sorted data cleaned up
	<-ch

	_, files, err = s.server.ListObjectsWithOptions("sorted", fakestorage.ListOptions{Prefix: "import"})
	s.NoError(err)
	s.Len(files, 0)

	// check subtask external field
	checkExternalFields(s.T(), s.tk)
}

func (s *mockGCSSuite) TestGlobalSortMultiFiles() {
	var allData []string
	for i := range 10 {
		var content []byte
		keyCnt := 1000
		for j := range keyCnt {
			idx := i*keyCnt + j
			content = append(content, fmt.Appendf(nil, "%d,test-%d\n", idx, idx)...)
			allData = append(allData, fmt.Sprintf("%d test-%d", idx, idx))
		}
		s.server.CreateObject(fakestorage.Object{
			ObjectAttrs: fakestorage.ObjectAttrs{BucketName: "gs-multi-files", Name: fmt.Sprintf("t.%d.csv", i)},
			Content:     content,
		})
	}
	slices.Sort(allData)
	s.prepareAndUseDB("gs_multi_files")
	s.server.CreateBucketWithOpts(fakestorage.CreateBucketOpts{Name: "sorted"})
	s.tk.MustExec("create table t (a bigint primary key , b varchar(100), key(b), key(a,b), key(b,a));")
	// 1 subtask, encoding 10 files using 4 threads.
	sortStorageURI := fmt.Sprintf("gs://sorted/gs_multi_files?endpoint=%s", gcsEndpoint)
	importSQL := fmt.Sprintf(`import into t FROM 'gs://gs-multi-files/t.*.csv?endpoint=%s'
		with cloud_storage_uri='%s'`, gcsEndpoint, sortStorageURI)
	s.tk.MustQuery(importSQL)
	s.tk.MustQuery("select * from t").Sort().Check(testkit.Rows(allData...))
}

func (s *mockGCSSuite) TestGlobalSortUniqueKeyConflict() {
	var allData []string
	for i := range 10 {
		var content []byte
		keyCnt := 1000
		for j := range keyCnt {
			idx := i*keyCnt + j
			content = append(content, fmt.Appendf(nil, "%d,test-%d\n", idx, idx)...)
		}
		if i == 9 {
			// add a duplicate key "test-123"
			content = append(content, []byte("99999999,test-123\n")...)
		}
		s.server.CreateObject(fakestorage.Object{
			ObjectAttrs: fakestorage.ObjectAttrs{BucketName: "gs-multi-files-uk", Name: fmt.Sprintf("t.%d.csv", i)},
			Content:     content,
		})
	}
	slices.Sort(allData)
	s.prepareAndUseDB("gs_multi_files")
	s.server.CreateBucketWithOpts(fakestorage.CreateBucketOpts{Name: "sorted"})
	s.tk.MustExec("create table t (a bigint primary key , b varchar(100) unique key);")
	// 1 subtask, encoding 10 files using 4 threads.
	sortStorageURI := fmt.Sprintf("gs://sorted/gs_multi_files?endpoint=%s", gcsEndpoint)
	importSQL := fmt.Sprintf(`import into t FROM 'gs://gs-multi-files-uk/t.*.csv?endpoint=%s'
		with cloud_storage_uri='%s', __max_engine_size='1', thread=8`, gcsEndpoint, sortStorageURI)
	err := s.tk.QueryToErr(importSQL)
	require.ErrorContains(s.T(), err, "duplicate key found")
	// this is the encoded value of "test-123". Because the table ID/ index ID may vary, we can't check the exact key
	// TODO: decode the key to use readable value in the error message.
	require.ErrorContains(s.T(), err, "746573742d313233")
}

func (s *mockGCSSuite) TestGlobalSortWithGCSReadError() {
	s.server.CreateObject(fakestorage.Object{
		ObjectAttrs: fakestorage.ObjectAttrs{BucketName: "gs-basic", Name: "t.1.csv"},
		Content:     []byte("1,foo1,bar1,123\n2,foo2,bar2,456\n3,foo3,bar3,789\n"),
	})
	s.server.CreateObject(fakestorage.Object{
		ObjectAttrs: fakestorage.ObjectAttrs{BucketName: "gs-basic", Name: "t.2.csv"},
		Content:     []byte("4,foo4,bar4,123\n5,foo5,bar5,223\n6,foo6,bar6,323\n"),
	})
	s.server.CreateBucketWithOpts(fakestorage.CreateBucketOpts{Name: "sorted"})
	s.prepareAndUseDB("gsort_basic")
	s.tk.MustExec(`create table t (a bigint primary key, b varchar(100), c varchar(100), d int,	key(a), key(c,d), key(d));`)
	defer func() {
		s.tk.MustExec("drop table t;")
	}()

	sortStorageURI := fmt.Sprintf("gs://sorted/import?endpoint=%s&access-key=aaaaaa&secret-access-key=bbbbbb", gcsEndpoint)
	importSQL := fmt.Sprintf(`import into t FROM 'gs://gs-basic/t.*.csv?endpoint=%s'
		with __max_engine_size = '1', cloud_storage_uri='%s', thread=1`, gcsEndpoint, sortStorageURI)

	testfailpoint.Enable(s.T(), "github.com/pingcap/tidb/br/pkg/storage/GCSReadUnexpectedEOF", "return(0)")
	s.tk.MustExec("truncate table t")
	result := s.tk.MustQuery(importSQL).Rows()
	s.Len(result, 1)
	s.tk.MustQuery("select * from t").Sort().Check(testkit.Rows(
		"1 foo1 bar1 123", "2 foo2 bar2 456", "3 foo3 bar3 789",
		"4 foo4 bar4 123", "5 foo5 bar5 223", "6 foo6 bar6 323",
	))
}
