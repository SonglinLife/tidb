// Copyright 2021 PingCAP, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//	http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
package ddl_test

import (
	"context"
	"math"
	"testing"

	"github.com/pingcap/tidb/pkg/ddl"
	"github.com/pingcap/tidb/pkg/infoschema"
	"github.com/pingcap/tidb/pkg/kv"
	"github.com/pingcap/tidb/pkg/meta"
	"github.com/pingcap/tidb/pkg/meta/model"
	"github.com/pingcap/tidb/pkg/parser/ast"
	"github.com/pingcap/tidb/pkg/sessionctx"
	"github.com/pingcap/tidb/pkg/sessionctx/vardef"
	"github.com/pingcap/tidb/pkg/testkit"
	"github.com/pingcap/tidb/pkg/util/dbterror"
	"github.com/stretchr/testify/require"
)

func testPlacementPolicyInfo(t *testing.T, store kv.Storage, name string, settings *model.PlacementSettings) *model.PolicyInfo {
	policy := &model.PolicyInfo{
		Name:              ast.NewCIStr(name),
		PlacementSettings: settings,
	}
	genIDs, err := genGlobalIDs(store, 1)
	require.NoError(t, err)
	policy.ID = genIDs[0]
	return policy
}

func testCreatePlacementPolicy(t *testing.T, ctx sessionctx.Context, d ddl.ExecutorForTest, policyInfo *model.PolicyInfo) *model.Job {
	job := &model.Job{
		Version:    model.GetJobVerInUse(),
		SchemaName: policyInfo.Name.L,
		Type:       model.ActionCreatePlacementPolicy,
		BinlogInfo: &model.HistoryInfo{},
	}
	args := &model.PlacementPolicyArgs{
		Policy: policyInfo,
	}

	ctx.SetValue(sessionctx.QueryString, "skip")
	err := d.DoDDLJobWrapper(ctx, ddl.NewJobWrapperWithArgs(job, args, false))
	require.NoError(t, err)

	v := getSchemaVer(t, ctx)
	policyInfo.State = model.StatePublic
	checkHistoryJobArgs(t, ctx, job.ID, &historyJobArgs{ver: v})
	policyInfo.State = model.StateNone
	return job
}

func TestPlacementPolicyInUse(t *testing.T) {
	store, dom := testkit.CreateMockStoreAndDomain(t)
	d := dom.DDLExecutor().(ddl.ExecutorForTest)

	sctx := testkit.NewTestKit(t, store).Session()

	db1, err := testSchemaInfo(store, "db1")
	require.NoError(t, err)
	testCreateSchema(t, sctx, d, db1)
	db1.State = model.StatePublic

	db2, err := testSchemaInfo(store, "db2")
	require.NoError(t, err)
	testCreateSchema(t, sctx, d, db2)
	db2.State = model.StatePublic

	policySettings := &model.PlacementSettings{PrimaryRegion: "r1", Regions: "r1,r2"}
	p1 := testPlacementPolicyInfo(t, store, "p1", policySettings)
	p2 := testPlacementPolicyInfo(t, store, "p2", policySettings)
	p3 := testPlacementPolicyInfo(t, store, "p3", policySettings)
	p4 := testPlacementPolicyInfo(t, store, "p4", policySettings)
	p5 := testPlacementPolicyInfo(t, store, "p5", policySettings)
	testCreatePlacementPolicy(t, sctx, d, p1)
	testCreatePlacementPolicy(t, sctx, d, p2)
	testCreatePlacementPolicy(t, sctx, d, p3)
	testCreatePlacementPolicy(t, sctx, d, p4)
	testCreatePlacementPolicy(t, sctx, d, p5)

	t1, err := testTableInfo(store, "t1", 1)
	require.NoError(t, err)
	t1.PlacementPolicyRef = &model.PolicyRefInfo{ID: p1.ID, Name: p1.Name}
	testCreateTable(t, sctx, d, db1, t1)
	t1.State = model.StatePublic
	db1.Deprecated.Tables = append(db1.Deprecated.Tables, t1)

	t2, err := testTableInfo(store, "t2", 1)
	require.NoError(t, err)
	t2.PlacementPolicyRef = &model.PolicyRefInfo{ID: p1.ID, Name: p1.Name}
	testCreateTable(t, sctx, d, db2, t2)
	t2.State = model.StatePublic
	db2.Deprecated.Tables = append(db2.Deprecated.Tables, t2)

	t3, err := testTableInfo(store, "t3", 1)
	require.NoError(t, err)
	t3.PlacementPolicyRef = &model.PolicyRefInfo{ID: p2.ID, Name: p2.Name}
	testCreateTable(t, sctx, d, db1, t3)
	t3.State = model.StatePublic
	db1.Deprecated.Tables = append(db1.Deprecated.Tables, t3)

	dbP, err := testSchemaInfo(store, "db_p")
	require.NoError(t, err)
	dbP.PlacementPolicyRef = &model.PolicyRefInfo{ID: p4.ID, Name: p4.Name}
	dbP.State = model.StatePublic
	testCreateSchema(t, sctx, d, dbP)

	t4 := testTableInfoWithPartition(t, store, "t4", 1)
	t4.Partition.Definitions[0].PlacementPolicyRef = &model.PolicyRefInfo{ID: p5.ID, Name: p5.Name}
	testCreateTable(t, sctx, d, db1, t4)
	t4.State = model.StatePublic
	db1.Deprecated.Tables = append(db1.Deprecated.Tables, t4)

	schemaCacheSize := vardef.SchemaCacheSize.Load()
	builder := infoschema.NewBuilder(dom, schemaCacheSize, nil, infoschema.NewData(), schemaCacheSize > 0)
	err = builder.InitWithDBInfos(
		[]*model.DBInfo{db1, db2, dbP},
		[]*model.PolicyInfo{p1, p2, p3, p4, p5},
		nil,
		1,
	)
	require.NoError(t, err)
	is := builder.Build(math.MaxUint64)

	ctx := kv.WithInternalSourceType(context.Background(), kv.InternalTxnDDL)
	for _, policy := range []*model.PolicyInfo{p1, p2, p4, p5} {
		require.True(t, dbterror.ErrPlacementPolicyInUse.Equal(ddl.CheckPlacementPolicyNotInUseFromInfoSchema(is, policy)))
		require.NoError(t, kv.RunInNewTxn(ctx, sctx.GetStore(), false, func(ctx context.Context, txn kv.Transaction) error {
			m := meta.NewMutator(txn)
			require.True(t, dbterror.ErrPlacementPolicyInUse.Equal(ddl.CheckPlacementPolicyNotInUseFromMeta(m, policy)))
			return nil
		}))
	}

	require.NoError(t, ddl.CheckPlacementPolicyNotInUseFromInfoSchema(is, p3))
	require.NoError(t, kv.RunInNewTxn(ctx, sctx.GetStore(), false, func(ctx context.Context, txn kv.Transaction) error {
		m := meta.NewMutator(txn)
		require.NoError(t, ddl.CheckPlacementPolicyNotInUseFromMeta(m, p3))
		return nil
	}))
}

// testTableInfoWithPartition creates a test table with num int columns and with no index.
func testTableInfoWithPartition(t *testing.T, store kv.Storage, name string, num int) *model.TableInfo {
	tblInfo, err := testTableInfo(store, name, num)
	require.NoError(t, err)
	genIDs, err := genGlobalIDs(store, 1)
	require.NoError(t, err)
	pid := genIDs[0]
	tblInfo.Partition = &model.PartitionInfo{
		Type:   ast.PartitionTypeRange,
		Expr:   tblInfo.Columns[0].Name.L,
		Enable: true,
		Definitions: []model.PartitionDefinition{{
			ID:       pid,
			Name:     ast.NewCIStr("p0"),
			LessThan: []string{"maxvalue"},
		}},
	}

	return tblInfo
}
