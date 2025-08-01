// Copyright 2015 PingCAP, Inc.
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

package ddl_test

import (
	"context"
	"fmt"
	"reflect"
	"strconv"
	"sync"
	"testing"

	"github.com/pingcap/errors"
	"github.com/pingcap/tidb/pkg/domain"
	"github.com/pingcap/tidb/pkg/kv"
	"github.com/pingcap/tidb/pkg/meta/model"
	"github.com/pingcap/tidb/pkg/parser/ast"
	"github.com/pingcap/tidb/pkg/parser/terror"
	"github.com/pingcap/tidb/pkg/sessionctx"
	"github.com/pingcap/tidb/pkg/store/mockstore"
	"github.com/pingcap/tidb/pkg/table"
	"github.com/pingcap/tidb/pkg/table/tables"
	"github.com/pingcap/tidb/pkg/tablecodec"
	"github.com/pingcap/tidb/pkg/testkit"
	"github.com/pingcap/tidb/pkg/testkit/testfailpoint"
	"github.com/pingcap/tidb/pkg/types"
	"github.com/stretchr/testify/require"
)

func testCreateColumn(tk *testkit.TestKit, t *testing.T, ctx sessionctx.Context, tblID int64,
	colName string, pos string, defaultValue any, dom *domain.Domain) int64 {
	sql := fmt.Sprintf("alter table t1 add column %s int ", colName)
	if defaultValue != nil {
		sql += fmt.Sprintf("default %v ", defaultValue)
	}
	sql += pos
	tk.MustExec(sql)
	idi, _ := strconv.Atoi(tk.MustQuery("admin show ddl jobs 1;").Rows()[0][0].(string))
	id := int64(idi)
	v := getSchemaVer(t, ctx)
	require.NoError(t, dom.Reload())
	tblInfo, exist := dom.InfoSchema().TableByID(context.Background(), tblID)
	require.True(t, exist)
	checkHistoryJobArgs(t, ctx, id, &historyJobArgs{ver: v, tbl: tblInfo.Meta()})
	return id
}

func testCreateColumns(tk *testkit.TestKit, t *testing.T, ctx sessionctx.Context, tblID int64,
	colNames []string, positions []string, defaultValue any, dom *domain.Domain) int64 {
	sql := "alter table t1 add column "
	for i, colName := range colNames {
		if i != 0 {
			sql += ", add column "
		}
		sql += fmt.Sprintf("%s int %s", colName, positions[i])
		if defaultValue != nil {
			sql += fmt.Sprintf(" default %v", defaultValue)
		}
	}
	tk.MustExec(sql)
	idi, _ := strconv.Atoi(tk.MustQuery("admin show ddl jobs 1;").Rows()[0][0].(string))
	id := int64(idi)
	v := getSchemaVer(t, ctx)
	require.NoError(t, dom.Reload())
	tblInfo, exist := dom.InfoSchema().TableByID(context.Background(), tblID)
	require.True(t, exist)
	checkHistoryJobArgs(t, ctx, id, &historyJobArgs{ver: v, tbl: tblInfo.Meta()})
	return id
}

func testDropColumnInternal(tk *testkit.TestKit, t *testing.T, ctx sessionctx.Context, tblID int64, colName string, isError bool, dom *domain.Domain) int64 {
	sql := fmt.Sprintf("alter table t1 drop column %s ", colName)
	_, err := tk.Exec(sql)
	if isError {
		require.Error(t, err)
	} else {
		require.NoError(t, err)
	}

	idi, _ := strconv.Atoi(tk.MustQuery("admin show ddl jobs 1;").Rows()[0][0].(string))
	id := int64(idi)
	v := getSchemaVer(t, ctx)
	require.NoError(t, dom.Reload())
	tblInfo, exist := dom.InfoSchema().TableByID(context.Background(), tblID)
	require.True(t, exist)
	checkHistoryJobArgs(t, ctx, id, &historyJobArgs{ver: v, tbl: tblInfo.Meta()})
	return id
}

func testDropTable(tk *testkit.TestKit, t *testing.T, dbName, tblName string, dom *domain.Domain) int64 {
	sql := fmt.Sprintf("drop table %s ", tblName)
	tk.MustExec("use " + dbName)
	tk.MustExec(sql)

	idi, _ := strconv.Atoi(tk.MustQuery("admin show ddl jobs 1;").Rows()[0][0].(string))
	id := int64(idi)
	require.NoError(t, dom.Reload())
	_, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr(dbName), ast.NewCIStr(tblName))
	require.Error(t, err)
	return id
}

func testCreateIndex(tk *testkit.TestKit, t *testing.T, ctx sessionctx.Context, tblID int64, unique bool, indexName string, colName string, dom *domain.Domain) int64 {
	un := ""
	if unique {
		un = "unique"
	}
	sql := fmt.Sprintf("alter table t1 add %s index %s(%s)", un, indexName, colName)
	tk.MustExec(sql)

	idi, _ := strconv.Atoi(tk.MustQuery("admin show ddl jobs 1;").Rows()[0][0].(string))
	id := int64(idi)
	v := getSchemaVer(t, ctx)
	require.NoError(t, dom.Reload())
	tblInfo, exist := dom.InfoSchema().TableByID(context.Background(), tblID)
	require.True(t, exist)
	checkHistoryJobArgs(t, ctx, id, &historyJobArgs{ver: v, tbl: tblInfo.Meta()})
	return id
}

func testDropColumns(tk *testkit.TestKit, t *testing.T, ctx sessionctx.Context, tblID int64, colName []string, isError bool, dom *domain.Domain) int64 {
	sql := "alter table t1 drop column "
	for i, name := range colName {
		if i != 0 {
			sql += ", drop column "
		}
		sql += name
	}
	_, err := tk.Exec(sql)
	if isError {
		require.Error(t, err)
	} else {
		require.NoError(t, err)
	}

	idi, _ := strconv.Atoi(tk.MustQuery("admin show ddl jobs 1;").Rows()[0][0].(string))
	id := int64(idi)
	v := getSchemaVer(t, ctx)
	require.NoError(t, dom.Reload())
	tblInfo, exist := dom.InfoSchema().TableByID(context.Background(), tblID)
	require.True(t, exist)
	checkHistoryJobArgs(t, ctx, id, &historyJobArgs{ver: v, tbl: tblInfo.Meta()})
	return id
}

func TestColumnBasic(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t, mockstore.WithDDLChecker())

	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("create table t1 (c1 int, c2 int, c3 int);")

	num := 10
	for i := range num {
		tk.MustExec(fmt.Sprintf("insert into t1 values(%d, %d, %d)", i, 10*i, 100*i))
	}

	ctx := testNewContext(t, store)
	txn, err := newTxn(ctx)
	require.NoError(t, err)

	var tableID int64
	rs := tk.MustQuery("select TIDB_TABLE_ID from information_schema.tables where table_name='t1' and table_schema='test';")
	tableIDi, _ := strconv.Atoi(rs.Rows()[0][0].(string))
	tableID = int64(tableIDi)

	tbl := testGetTable(t, dom, tableID)

	i := 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Len(t, data, 3)
		require.Equal(t, data[0].GetInt64(), int64(i))
		require.Equal(t, data[1].GetInt64(), int64(10*i))
		require.Equal(t, data[2].GetInt64(), int64(100*i))
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equal(t, i, num)

	require.Nil(t, table.FindCol(tbl.Cols(), "c4"))

	jobID := testCreateColumn(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c4", "after c3", 100, dom)
	testCheckJobDone(t, store, jobID, true)

	tbl = testGetTable(t, dom, tableID)
	require.NotNil(t, table.FindCol(tbl.Cols(), "c4"))

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(),
		func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
			require.Len(t, data, 4)
			require.Equal(t, data[0].GetInt64(), int64(i))
			require.Equal(t, data[1].GetInt64(), int64(10*i))
			require.Equal(t, data[2].GetInt64(), int64(100*i))
			require.Equal(t, data[3].GetInt64(), int64(100))
			i++
			return true, nil
		})
	require.NoError(t, err)
	require.Equal(t, i, num)

	h, err := tbl.AddRecord(ctx.GetTableCtx(), txn, types.MakeDatums(11, 12, 13, 14))
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	_, err = newTxn(ctx)
	require.NoError(t, err)
	values, err := tables.RowWithCols(tbl, ctx, h, tbl.Cols())
	require.NoError(t, err)

	require.Len(t, values, 4)
	require.Equal(t, values[3].GetInt64(), int64(14))

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c4", false, dom)
	testCheckJobDone(t, store, jobID, false)

	tbl = testGetTable(t, dom, tableID)
	values, err = tables.RowWithCols(tbl, ctx, h, tbl.Cols())
	require.NoError(t, err)

	require.Len(t, values, 3)
	require.Equal(t, values[2].GetInt64(), int64(13))

	jobID = testCreateColumn(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c4", "", 111, dom)
	testCheckJobDone(t, store, jobID, true)

	tbl = testGetTable(t, dom, tableID)
	values, err = tables.RowWithCols(tbl, ctx, h, tbl.Cols())
	require.NoError(t, err)

	require.Len(t, values, 4)
	require.Equal(t, values[3].GetInt64(), int64(111))

	jobID = testCreateColumn(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c5", "", 101, dom)
	testCheckJobDone(t, store, jobID, true)

	tbl = testGetTable(t, dom, tableID)
	values, err = tables.RowWithCols(tbl, ctx, h, tbl.Cols())
	require.NoError(t, err)

	require.Len(t, values, 5)
	require.Equal(t, values[4].GetInt64(), int64(101))

	jobID = testCreateColumn(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c6", "first", 202, dom)
	testCheckJobDone(t, store, jobID, true)

	tbl = testGetTable(t, dom, tableID)
	cols := tbl.Cols()
	require.Len(t, cols, 6)
	require.Equal(t, cols[0].Offset, 0)
	require.Equal(t, cols[0].Name.L, "c6")
	require.Equal(t, cols[1].Offset, 1)
	require.Equal(t, cols[1].Name.L, "c1")
	require.Equal(t, cols[2].Offset, 2)
	require.Equal(t, cols[2].Name.L, "c2")
	require.Equal(t, cols[3].Offset, 3)
	require.Equal(t, cols[3].Name.L, "c3")
	require.Equal(t, cols[4].Offset, 4)
	require.Equal(t, cols[4].Name.L, "c4")
	require.Equal(t, cols[5].Offset, 5)
	require.Equal(t, cols[5].Name.L, "c5")

	values, err = tables.RowWithCols(tbl, ctx, h, cols)
	require.NoError(t, err)

	require.Len(t, values, 6)
	require.Equal(t, values[0].GetInt64(), int64(202))
	require.Equal(t, values[5].GetInt64(), int64(101))

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c2", false, dom)
	testCheckJobDone(t, store, jobID, false)

	tbl = testGetTable(t, dom, tableID)

	values, err = tables.RowWithCols(tbl, ctx, h, tbl.Cols())
	require.NoError(t, err)
	require.Len(t, values, 5)
	require.Equal(t, values[0].GetInt64(), int64(202))
	require.Equal(t, values[4].GetInt64(), int64(101))

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c1", false, dom)
	testCheckJobDone(t, store, jobID, false)

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c3", false, dom)
	testCheckJobDone(t, store, jobID, false)

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c4", false, dom)
	testCheckJobDone(t, store, jobID, false)

	jobID = testCreateIndex(tk, t, testkit.NewTestKit(t, store).Session(), tableID, false, "c5_idx", "c5", dom)
	testCheckJobDone(t, store, jobID, true)

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c5", false, dom)
	testCheckJobDone(t, store, jobID, false)

	jobID = testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, "c6", true, dom)
	testCheckJobDone(t, store, jobID, false)

	testDropTable(tk, t, "test", "t1", dom)
}

func checkColumnKVExist(ctx sessionctx.Context, t table.Table, handle kv.Handle, col *table.Column, columnValue any, isExist bool) error {
	txn, err := newTxn(ctx)
	if err != nil {
		return errors.Trace(err)
	}
	defer func() {
		err = txn.Commit(context.Background())
		if err != nil {
			panic(err)
		}
	}()
	key := tablecodec.EncodeRecordKey(t.RecordPrefix(), handle)
	data, err := txn.Get(context.TODO(), key)
	if !isExist {
		if terror.ErrorEqual(err, kv.ErrNotExist) {
			return nil
		}
	}
	if err != nil {
		return errors.Trace(err)
	}
	colMap := make(map[int64]*types.FieldType)
	colMap[col.ID] = &col.FieldType
	rowMap, err := tablecodec.DecodeRowToDatumMap(data, colMap, ctx.GetSessionVars().Location())
	if err != nil {
		return errors.Trace(err)
	}
	val, ok := rowMap[col.ID]
	if isExist {
		if !ok || val.GetValue() != columnValue {
			return errors.Errorf("%v is not equal to %v", val.GetValue(), columnValue)
		}
	} else {
		if ok {
			return errors.Errorf("column value should not exists")
		}
	}
	return nil
}

func checkNoneColumn(t *testing.T, ctx sessionctx.Context, tableID int64, handle kv.Handle, col *table.Column, columnValue any, dom *domain.Domain) {
	tbl := testGetTable(t, dom, tableID)
	err := checkColumnKVExist(ctx, tbl, handle, col, columnValue, false)
	require.NoError(t, err)
	err = testGetColumn(tbl, col.Name.L, false)
	require.NoError(t, err)
}

func checkDeleteOnlyColumn(t *testing.T, ctx sessionctx.Context, tableID int64, handle kv.Handle, col *table.Column, row []types.Datum, columnValue any, dom *domain.Domain) {
	tbl := testGetTable(t, dom, tableID)
	_, err := newTxn(ctx)
	require.NoError(t, err)
	i := 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, row), "%v not equal to %v", data, row)
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)
	err = checkColumnKVExist(ctx, tbl, handle, col, columnValue, false)
	require.NoError(t, err)
	// Test add a new row.
	txn, err := newTxn(ctx)
	require.NoError(t, err)

	newRow := types.MakeDatums(int64(11), int64(22), int64(33))
	newHandle, err := tbl.AddRecord(ctx.GetTableCtx(), txn, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	rows := [][]types.Datum{row, newRow}

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, rows[i]), "%v not equal to %v", data, rows[i])
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 2, i, "expect 2, got %v", i)

	err = checkColumnKVExist(ctx, tbl, handle, col, columnValue, false)
	require.NoError(t, err)
	// Test remove a row.
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	err = tbl.RemoveRecord(ctx.GetTableCtx(), txn, newHandle, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)
	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		i++
		return true, nil
	})
	require.NoError(t, err)

	require.Equalf(t, 1, i, "expect 1, got %v", i)
	err = checkColumnKVExist(ctx, tbl, newHandle, col, columnValue, false)
	require.NoError(t, err)
	err = testGetColumn(tbl, col.Name.L, false)
	require.NoError(t, err)
}

func checkWriteOnlyColumn(t *testing.T, ctx sessionctx.Context, tableID int64, handle kv.Handle, col *table.Column, row []types.Datum, columnValue any, dom *domain.Domain) {
	tbl := testGetTable(t, dom, tableID)
	_, err := newTxn(ctx)
	require.NoError(t, err)

	i := 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, row), "%v not equal to %v", data, row)
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)

	err = checkColumnKVExist(ctx, tbl, handle, col, columnValue, false)
	require.NoError(t, err)

	// Test add a new row.
	txn, err := newTxn(ctx)
	require.NoError(t, err)

	newRow := types.MakeDatums(int64(11), int64(22), int64(33))
	newHandle, err := tbl.AddRecord(ctx.GetTableCtx(), txn, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	rows := [][]types.Datum{row, newRow}

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, rows[i]), "%v not equal to %v", data, rows[i])
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 2, i, "expect 2, got %v", i)

	err = checkColumnKVExist(ctx, tbl, newHandle, col, columnValue, true)
	require.NoError(t, err)
	// Test remove a row.
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	err = tbl.RemoveRecord(ctx.GetTableCtx(), txn, newHandle, newRow)
	require.NoError(t, err)

	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)

	err = checkColumnKVExist(ctx, tbl, newHandle, col, columnValue, false)
	require.NoError(t, err)
	err = testGetColumn(tbl, col.Name.L, false)
	require.NoError(t, err)
}

func checkReorganizationColumn(t *testing.T, ctx sessionctx.Context, tableID int64, col *table.Column, row []types.Datum, columnValue any, dom *domain.Domain) {
	tbl := testGetTable(t, dom, tableID)
	_, err := newTxn(ctx)
	require.NoError(t, err)

	i := 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, row), "%v not equal to %v", data, row)
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)

	// Test add a new row.
	txn, err := newTxn(ctx)
	require.NoError(t, err)

	newRow := types.MakeDatums(int64(11), int64(22), int64(33))
	newHandle, err := tbl.AddRecord(ctx.GetTableCtx(), txn, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	rows := [][]types.Datum{row, newRow}

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, rows[i]), "%v not equal to %v", data, rows[i])
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 2, i, "expect 2, got %v", i)

	err = checkColumnKVExist(ctx, tbl, newHandle, col, columnValue, true)
	require.NoError(t, err)

	// Test remove a row.
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	err = tbl.RemoveRecord(ctx.GetTableCtx(), txn, newHandle, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)
	err = testGetColumn(tbl, col.Name.L, false)
	require.NoError(t, err)
}

func checkPublicColumn(t *testing.T, ctx sessionctx.Context, tableID int64, newCol *table.Column, oldRow []types.Datum, columnValue any, dom *domain.Domain, columnCnt int) {
	tbl := testGetTable(t, dom, tableID)
	_, err := newTxn(ctx)
	require.NoError(t, err)

	i := 0
	updatedRow := make([]types.Datum, 0, len(oldRow)+columnCnt)
	updatedRow = append(updatedRow, oldRow...)
	for range columnCnt {
		updatedRow = append(updatedRow, types.NewDatum(columnValue))
	}
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, updatedRow), "%v not equal to %v", data, updatedRow)
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)

	// Test add a new row.
	txn, err := newTxn(ctx)
	require.NoError(t, err)

	newRow := types.MakeDatums(int64(11), int64(22), int64(33), int64(44))
	for j := 1; j < columnCnt; j++ {
		newRow = append(newRow, types.NewDatum(int64(44)))
	}
	handle, err := tbl.AddRecord(ctx.GetTableCtx(), txn, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	rows := [][]types.Datum{updatedRow, newRow}

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, rows[i]), "%v not equal to %v", data, rows[i])
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 2, i, "expect 2, got %v", i)

	// Test remove a row.
	txn, err = newTxn(ctx)
	require.NoError(t, err)

	err = tbl.RemoveRecord(ctx.GetTableCtx(), txn, handle, newRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)

	txn, err = newTxn(ctx)
	require.NoError(t, err)

	i = 0
	err = tables.IterRecords(tbl, ctx, tbl.Cols(), func(_ kv.Handle, data []types.Datum, cols []*table.Column) (bool, error) {
		require.Truef(t, reflect.DeepEqual(data, rows[i]), "%v not equal to %v", data, rows[i])
		i++
		return true, nil
	})
	require.NoError(t, err)
	require.Equalf(t, 1, i, "expect 1, got %v", i)

	err = testGetColumn(tbl, newCol.Name.L, true)
	require.NoError(t, err)
}

func checkAddColumn(t *testing.T, state model.SchemaState, tableID int64, handle kv.Handle, newCol *table.Column, oldRow []types.Datum, columnValue any, dom *domain.Domain, store kv.Storage, columnCnt int) {
	ctx := testNewContext(t, store)
	switch state {
	case model.StateNone:
		checkNoneColumn(t, ctx, tableID, handle, newCol, columnValue, dom)
	case model.StateDeleteOnly:
		checkDeleteOnlyColumn(t, ctx, tableID, handle, newCol, oldRow, columnValue, dom)
	case model.StateWriteOnly:
		checkWriteOnlyColumn(t, ctx, tableID, handle, newCol, oldRow, columnValue, dom)
	case model.StateWriteReorganization, model.StateDeleteReorganization:
		checkReorganizationColumn(t, ctx, tableID, newCol, oldRow, columnValue, dom)
	case model.StatePublic:
		checkPublicColumn(t, ctx, tableID, newCol, oldRow, columnValue, dom, columnCnt)
	}
}

func testGetColumn(t table.Table, name string, isExist bool) error {
	col := table.FindCol(t.Cols(), name)
	if isExist {
		if col == nil {
			return errors.Errorf("column should not be nil")
		}
	} else {
		if col != nil {
			return errors.Errorf("column should be nil")
		}
	}
	return nil
}

func TestAddColumn(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t, mockstore.WithDDLChecker())

	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("create table t1 (c1 int, c2 int, c3 int);")

	var tableID int64
	rs := tk.MustQuery("select TIDB_TABLE_ID from information_schema.tables where table_name='t1' and table_schema='test';")
	tableIDi, _ := strconv.Atoi(rs.Rows()[0][0].(string))
	tableID = int64(tableIDi)
	tbl := testGetTable(t, dom, tableID)

	ctx := testNewContext(t, store)
	txn, err := newTxn(ctx)
	require.NoError(t, err)
	oldRow := types.MakeDatums(int64(1), int64(2), int64(3))
	handle, err := tbl.AddRecord(ctx.GetTableCtx(), txn, oldRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)

	newColName := "c4"
	defaultColValue := int64(4)

	checkOK := false

	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/afterWaitSchemaSynced", func(job *model.Job) {
		if checkOK {
			return
		}

		tbl := testGetTable(t, dom, tableID)
		newCol := table.FindCol(tbl.(*tables.TableCommon).Columns, newColName)
		if newCol == nil {
			return
		}

		checkAddColumn(t, newCol.State, tableID, handle, newCol, oldRow, defaultColValue, dom, store, 1)

		if newCol.State == model.StatePublic {
			checkOK = true
		}
	})

	jobID := testCreateColumn(tk, t, testkit.NewTestKit(t, store).Session(), tableID, newColName, "", defaultColValue, dom)
	testCheckJobDone(t, store, jobID, true)

	require.True(t, checkOK)

	jobID = testDropTable(tk, t, "test", "t1", dom)
	testCheckJobDone(t, store, jobID, false)
}

func TestAddColumns(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t, mockstore.WithDDLChecker())

	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("create table t1 (c1 int, c2 int, c3 int);")

	newColNames := []string{"c4", "c5", "c6"}
	positions := make([]string, 3)
	for i := range positions {
		positions[i] = ""
	}
	defaultColValue := int64(4)

	var mu sync.Mutex
	var hookErr error
	checkOK := false

	var tableID int64
	rs := tk.MustQuery("select TIDB_TABLE_ID from information_schema.tables where table_name='t1' and table_schema='test';")
	tableIDi, _ := strconv.Atoi(rs.Rows()[0][0].(string))
	tableID = int64(tableIDi)
	tbl := testGetTable(t, dom, tableID)

	ctx := testNewContext(t, store)
	txn, err := newTxn(ctx)
	require.NoError(t, err)
	oldRow := types.MakeDatums(int64(1), int64(2), int64(3))
	handle, err := tbl.AddRecord(ctx.GetTableCtx(), txn, oldRow)
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)

	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/afterWaitSchemaSynced", func(job *model.Job) {
		mu.Lock()
		defer mu.Unlock()
		if checkOK {
			return
		}

		tbl := testGetTable(t, dom, tableID)
		for _, newColName := range newColNames {
			newCol := table.FindCol(tbl.(*tables.TableCommon).Columns, newColName)
			if newCol == nil {
				return
			}

			checkAddColumn(t, newCol.State, tableID, handle, newCol, oldRow, defaultColValue, dom, store, 3)

			if newCol.State == model.StatePublic {
				checkOK = true
			}
		}
	})

	jobID := testCreateColumns(tk, t, testkit.NewTestKit(t, store).Session(), tableID, newColNames, positions, defaultColValue, dom)

	testCheckJobDone(t, store, jobID, true)
	mu.Lock()
	hErr := hookErr
	ok := checkOK
	mu.Unlock()
	require.NoError(t, hErr)
	require.True(t, ok)

	jobID = testDropTable(tk, t, "test", "t1", dom)
	testCheckJobDone(t, store, jobID, false)
}

func TestDropColumnInColumnTest(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("create table t1 (c1 int, c2 int, c3 int, c4 int);")

	var tableID int64
	rs := tk.MustQuery("select TIDB_TABLE_ID from information_schema.tables where table_name='t1' and table_schema='test';")
	tableIDi, _ := strconv.Atoi(rs.Rows()[0][0].(string))
	tableID = int64(tableIDi)
	tbl := testGetTable(t, dom, tableID)

	ctx := testNewContext(t, store)
	colName := "c4"
	defaultColValue := int64(4)
	row := types.MakeDatums(int64(1), int64(2), int64(3))
	txn, err := newTxn(ctx)
	require.NoError(t, err)
	_, err = tbl.AddRecord(ctx.GetTableCtx(), txn, append(row, types.NewDatum(defaultColValue)))
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)

	checkOK := false
	var hookErr error
	var mu sync.Mutex

	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/afterWaitSchemaSynced", func(job *model.Job) {
		mu.Lock()
		defer mu.Unlock()
		if checkOK {
			return
		}
		tbl := testGetTable(t, dom, tableID)
		col := table.FindCol(tbl.(*tables.TableCommon).Columns, colName)
		if col == nil {
			checkOK = true
			return
		}
	})

	jobID := testDropColumnInternal(tk, t, testkit.NewTestKit(t, store).Session(), tableID, colName, false, dom)
	testCheckJobDone(t, store, jobID, false)
	mu.Lock()
	hErr := hookErr
	ok := checkOK
	mu.Unlock()
	require.NoError(t, hErr)
	require.True(t, ok)

	jobID = testDropTable(tk, t, "test", "t1", dom)
	testCheckJobDone(t, store, jobID, false)
}

func TestDropColumns(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("create table t1 (c1 int, c2 int, c3 int, c4 int);")

	var tableID int64
	rs := tk.MustQuery("select TIDB_TABLE_ID from information_schema.tables where table_name='t1' and table_schema='test';")
	tableIDi, _ := strconv.Atoi(rs.Rows()[0][0].(string))
	tableID = int64(tableIDi)
	tbl := testGetTable(t, dom, tableID)

	ctx := testNewContext(t, store)
	txn, err := newTxn(ctx)
	require.NoError(t, err)

	colNames := []string{"c3", "c4"}
	defaultColValue := int64(4)
	row := types.MakeDatums(int64(1), int64(2), int64(3))
	_, err = tbl.AddRecord(ctx.GetTableCtx(), txn, append(row, types.NewDatum(defaultColValue)))
	require.NoError(t, err)
	err = txn.Commit(context.Background())
	require.NoError(t, err)

	checkOK := false
	var hookErr error
	var mu sync.Mutex

	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/afterWaitSchemaSynced", func(job *model.Job) {
		mu.Lock()
		defer mu.Unlock()
		if checkOK {
			return
		}
		tbl := testGetTable(t, dom, tableID)
		for _, colName := range colNames {
			col := table.FindCol(tbl.(*tables.TableCommon).Columns, colName)
			if col == nil {
				checkOK = true
				return
			}
		}
	})

	jobID := testDropColumns(tk, t, testkit.NewTestKit(t, store).Session(), tableID, colNames, false, dom)
	testCheckJobDone(t, store, jobID, false)
	mu.Lock()
	hErr := hookErr
	ok := checkOK
	mu.Unlock()
	require.NoError(t, hErr)
	require.True(t, ok)

	jobID = testDropTable(tk, t, "test", "t1", dom)
	testCheckJobDone(t, store, jobID, false)
}

func testGetTable(t *testing.T, dom *domain.Domain, tableID int64) table.Table {
	require.NoError(t, dom.Reload())
	tbl, exist := dom.InfoSchema().TableByID(context.Background(), tableID)
	require.True(t, exist)
	return tbl
}

func TestWriteDataWriteOnlyMode(t *testing.T) {
	store := testkit.CreateMockStoreWithSchemaLease(t, dbTestLease)

	tk := testkit.NewTestKit(t, store)
	tk2 := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk2.MustExec("use test")
	tk.MustExec("CREATE TABLE t (`col1` bigint(20) DEFAULT 1,`col2` float,UNIQUE KEY `key1` (`col1`))")

	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/beforeRunOneJobStep", func(job *model.Job) {
		if job.SchemaState != model.StateWriteOnly {
			return
		}
		tk2.MustExec("insert ignore into t values (1, 2)")
		tk2.MustExec("insert ignore into t values (2, 2)")
	})
	tk.MustExec("alter table t change column `col1` `col1` varchar(20)")

	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/beforeRunOneJobStep", func(job *model.Job) {
		if job.SchemaState != model.StateWriteOnly {
			return
		}
		tk2.MustExec("insert ignore into t values (1)")
		tk2.MustExec("insert ignore into t values (2)")
	})
	tk.MustExec("alter table t drop column `col1`")
}

func TestModifyColumnWithIndex(t *testing.T) {
	store, _ := testkit.CreateMockStoreAndDomain(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec(`create table t (a int, b int,
		index idx1 (a), index idx2 (a), index idx3 (a),
		index idx4 (b), index idx5 (b), index idx6 (b),
		index idx7 (a, b), index idx8 (a, b), index idx9 (a, b));`)
	tk.MustExec("insert into t values (1, 1)")
	tk.MustExec("set global tidb_ddl_reorg_worker_cnt = 1")

	cnt := 0
	testfailpoint.EnableCall(t, "github.com/pingcap/tidb/pkg/ddl/addIndexTxnWorkerBackfillData", func(idxRecordNum int) {
		cnt += idxRecordNum
	})
	tk.MustExec("alter table t modify column a bigint")
	require.Equal(t, 0, cnt)
	tk.MustExec("alter table t modify column a int")
	require.Equal(t, 6, cnt)

	cnt = 0
	tk.MustExec("alter table t modify column a bigint, modify column b bigint")
	require.Equal(t, 0, cnt)
	tk.MustExec("alter table t modify column a int, modify column b int")
	require.Equal(t, 12, cnt)
}
