// Copyright 2022 PingCAP, Inc.
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

package external

import (
	"context"
	"fmt"
	"strings"
	"testing"

	"github.com/pingcap/tidb/pkg/domain"
	"github.com/pingcap/tidb/pkg/parser/ast"
	"github.com/pingcap/tidb/pkg/table"
	"github.com/pingcap/tidb/pkg/table/tables"
	"github.com/pingcap/tidb/pkg/testkit"
	"github.com/stretchr/testify/require"
)

// GetTableByName gets table by name for test.
func GetTableByName(t *testing.T, tk *testkit.TestKit, db, table string) table.Table {
	dom := domain.GetDomain(tk.Session())
	// Make sure the table schema is the new schema.
	require.NoError(t, dom.Reload())
	tbl, err := dom.InfoSchema().TableByName(context.Background(), ast.NewCIStr(db), ast.NewCIStr(table))
	require.NoError(t, err)
	return tbl
}

// GetModifyColumn is used to get the changed column name after ALTER TABLE.
func GetModifyColumn(t *testing.T, tk *testkit.TestKit, db, tbl, colName string, allColumn bool) *table.Column {
	tt := GetTableByName(t, tk, db, tbl)
	colName = strings.ToLower(colName)
	var cols []*table.Column
	if allColumn {
		cols = tt.(*tables.TableCommon).Columns
	} else {
		cols = tt.Cols()
	}
	for _, col := range cols {
		if col.Name.L == colName {
			return col
		}
	}
	return nil
}

// GetIndexID is used to get the index ID from full qualified name.
func GetIndexID(t *testing.T, tk *testkit.TestKit, dbName, tblName, idxName string) int64 {
	is := domain.GetDomain(tk.Session()).InfoSchema()
	tt, err := is.TableByName(context.Background(), ast.NewCIStr(dbName), ast.NewCIStr(tblName))
	require.NoError(t, err)

	for _, idx := range tt.Indices() {
		if idx.Meta().Name.L == idxName {
			return idx.Meta().ID
		}
	}

	require.FailNow(t, fmt.Sprintf("index %s not found(db: %s, tbl: %s)", idxName, dbName, tblName))
	return -1
}
