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

package hashjoin

import (
	"context"
	"fmt"
	"math/rand"
	"strings"
	"testing"

	"github.com/pingcap/failpoint"
	"github.com/pingcap/tidb/pkg/executor/join"
	"github.com/pingcap/tidb/pkg/session"
	"github.com/pingcap/tidb/pkg/sessionctx/vardef"
	"github.com/pingcap/tidb/pkg/testkit"
	"github.com/pingcap/tidb/pkg/util/dbterror/exeerrors"
	"github.com/stretchr/testify/require"
)

func TestIndexNestedLoopHashJoin(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")

	tk.MustExec("set @@tidb_init_chunk_size=2")
	tk.MustExec("set @@tidb_index_join_batch_size=10")
	tk.MustExec("DROP TABLE IF EXISTS t, s")
	tk.Session().GetSessionVars().EnableClusteredIndex = vardef.ClusteredIndexDefModeIntOnly
	tk.MustExec("create table t(pk int primary key, a int)")
	for i := range 100 {
		tk.MustExec(fmt.Sprintf("insert into t values(%d, %d)", i, i))
	}
	tk.MustExec("create table s(a int primary key)")
	for i := range 100 {
		if rand.Float32() < 0.3 {
			tk.MustExec(fmt.Sprintf("insert into s values(%d)", i))
		} else {
			tk.MustExec(fmt.Sprintf("insert into s values(%d)", i*100))
		}
	}
	tk.MustExec("analyze table t all columns")
	tk.MustExec("analyze table s all columns")
	// Test IndexNestedLoopHashJoin keepOrder.
	tk.MustQuery("explain format = 'brief' select /*+ INL_HASH_JOIN(s) */ * from t left join s on t.a=s.a order by t.pk").Check(testkit.Rows(
		"IndexHashJoin 100.00 root  left outer join, inner:TableReader, left side:TableReader, outer key:test.t.a, inner key:test.s.a, equal cond:eq(test.t.a, test.s.a)",
		"├─TableReader(Build) 100.00 root  data:TableFullScan",
		"│ └─TableFullScan 100.00 cop[tikv] table:t keep order:true",
		"└─TableReader(Probe) 100.00 root  data:TableRangeScan",
		"  └─TableRangeScan 100.00 cop[tikv] table:s range: decided by [test.t.a], keep order:false",
	))
	rs := tk.MustQuery("select /*+ INL_HASH_JOIN(s) */ * from t left join s on t.a=s.a order by t.pk")
	for i, row := range rs.Rows() {
		require.Equal(t, fmt.Sprintf("%d", i), row[0].(string))
	}

	// index hash join with semi join
	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/planner/core/MockOnlyEnableIndexHashJoinV2", "return(true)"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/planner/core/MockOnlyEnableIndexHashJoinV2"))
	}()
	tk.MustExec("drop table t")
	tk.MustExec("CREATE TABLE `t` (	`l_orderkey` int(11) NOT NULL,`l_linenumber` int(11) NOT NULL,`l_partkey` int(11) DEFAULT NULL,`l_suppkey` int(11) DEFAULT NULL,PRIMARY KEY (`l_orderkey`,`l_linenumber`))")
	tk.MustExec(`insert into t values(0,0,0,0);`)
	tk.MustExec(`insert into t values(0,1,0,1);`)
	tk.MustExec(`insert into t values(0,2,0,0);`)
	tk.MustExec(`insert into t values(1,0,1,0);`)
	tk.MustExec(`insert into t values(1,1,1,1);`)
	tk.MustExec(`insert into t values(1,2,1,0);`)
	tk.MustExec(`insert into t values(2,0,0,0);`)
	tk.MustExec(`insert into t values(2,1,0,1);`)
	tk.MustExec(`insert into t values(2,2,0,0);`)

	tk.MustExec("analyze table t all columns")

	// test semi join
	tk.Session().GetSessionVars().InitChunkSize = 2
	tk.Session().GetSessionVars().MaxChunkSize = 2
	tk.MustExec("set @@tidb_index_join_batch_size=2")
	tk.MustQuery("desc format = 'brief' select * from t l1 where exists ( select * from t l2 where l2.l_orderkey = l1.l_orderkey and l2.l_suppkey <> l1.l_suppkey ) order by `l_orderkey`,`l_linenumber`;").Check(testkit.Rows(
		"Sort 7.20 root  test.t.l_orderkey, test.t.l_linenumber",
		"└─IndexHashJoin 7.20 root  semi join, inner:IndexLookUp, left side:TableReader, outer key:test.t.l_orderkey, inner key:test.t.l_orderkey, equal cond:eq(test.t.l_orderkey, test.t.l_orderkey), other cond:ne(test.t.l_suppkey, test.t.l_suppkey)",
		"  ├─TableReader(Build) 9.00 root  data:Selection",
		"  │ └─Selection 9.00 cop[tikv]  not(isnull(test.t.l_suppkey))",
		"  │   └─TableFullScan 9.00 cop[tikv] table:l1 keep order:false",
		"  └─IndexLookUp(Probe) 27.00 root  ",
		"    ├─IndexRangeScan(Build) 27.00 cop[tikv] table:l2, index:PRIMARY(l_orderkey, l_linenumber) range: decided by [eq(test.t.l_orderkey, test.t.l_orderkey)], keep order:false",
		"    └─Selection(Probe) 27.00 cop[tikv]  not(isnull(test.t.l_suppkey))",
		"      └─TableRowIDScan 27.00 cop[tikv] table:l2 keep order:false"))
	tk.MustQuery("select * from t l1 where exists ( select * from t l2 where l2.l_orderkey = l1.l_orderkey and l2.l_suppkey <> l1.l_suppkey )order by `l_orderkey`,`l_linenumber`;").Check(testkit.Rows("0 0 0 0", "0 1 0 1", "0 2 0 0", "1 0 1 0", "1 1 1 1", "1 2 1 0", "2 0 0 0", "2 1 0 1", "2 2 0 0"))
	tk.MustQuery("desc format = 'brief' select count(*) from t l1 where exists ( select * from t l2 where l2.l_orderkey = l1.l_orderkey and l2.l_suppkey <> l1.l_suppkey );").Check(testkit.Rows(
		"StreamAgg 1.00 root  funcs:count(1)->Column#11",
		"└─IndexHashJoin 7.20 root  semi join, inner:IndexLookUp, left side:TableReader, outer key:test.t.l_orderkey, inner key:test.t.l_orderkey, equal cond:eq(test.t.l_orderkey, test.t.l_orderkey), other cond:ne(test.t.l_suppkey, test.t.l_suppkey)",
		"  ├─TableReader(Build) 9.00 root  data:Selection",
		"  │ └─Selection 9.00 cop[tikv]  not(isnull(test.t.l_suppkey))",
		"  │   └─TableFullScan 9.00 cop[tikv] table:l1 keep order:false",
		"  └─IndexLookUp(Probe) 27.00 root  ",
		"    ├─IndexRangeScan(Build) 27.00 cop[tikv] table:l2, index:PRIMARY(l_orderkey, l_linenumber) range: decided by [eq(test.t.l_orderkey, test.t.l_orderkey)], keep order:false",
		"    └─Selection(Probe) 27.00 cop[tikv]  not(isnull(test.t.l_suppkey))",
		"      └─TableRowIDScan 27.00 cop[tikv] table:l2 keep order:false"))
	tk.MustQuery("select count(*) from t l1 where exists ( select * from t l2 where l2.l_orderkey = l1.l_orderkey and l2.l_suppkey <> l1.l_suppkey );").Check(testkit.Rows("9"))
	tk.MustExec("DROP TABLE IF EXISTS t, s")

	// issue16586
	tk.MustExec("use test;")
	tk.MustExec("drop table if exists lineitem;")
	tk.MustExec("drop table if exists orders;")
	tk.MustExec("drop table if exists supplier;")
	tk.MustExec("drop table if exists nation;")
	tk.MustExec("CREATE TABLE `lineitem` (`l_orderkey` int(11) NOT NULL,`l_linenumber` int(11) NOT NULL,`l_partkey` int(11) DEFAULT NULL,`l_suppkey` int(11) DEFAULT NULL,PRIMARY KEY (`l_orderkey`,`l_linenumber`)	);")
	tk.MustExec("CREATE TABLE `supplier` (	`S_SUPPKEY` bigint(20) NOT NULL,`S_NATIONKEY` bigint(20) NOT NULL,PRIMARY KEY (`S_SUPPKEY`));")
	tk.MustExec("CREATE TABLE `orders` (`O_ORDERKEY` bigint(20) NOT NULL,`O_ORDERSTATUS` char(1) NOT NULL,PRIMARY KEY (`O_ORDERKEY`));")
	tk.MustExec("CREATE TABLE `nation` (`N_NATIONKEY` bigint(20) NOT NULL,`N_NAME` char(25) NOT NULL,PRIMARY KEY (`N_NATIONKEY`))")
	tk.MustExec("insert into lineitem values(0,0,0,1)")
	tk.MustExec("insert into lineitem values(0,1,1,1)")
	tk.MustExec("insert into lineitem values(0,2,2,0)")
	tk.MustExec("insert into lineitem values(0,3,3,3)")
	tk.MustExec("insert into lineitem values(0,4,1,4)")
	tk.MustExec("insert into supplier values(0, 4)")
	tk.MustExec("insert into orders values(0, 'F')")
	tk.MustExec("insert into nation values(0, 'EGYPT')")
	tk.MustExec("insert into lineitem values(1,0,2,4)")
	tk.MustExec("insert into lineitem values(1,1,1,0)")
	tk.MustExec("insert into lineitem values(1,2,3,3)")
	tk.MustExec("insert into lineitem values(1,3,1,0)")
	tk.MustExec("insert into lineitem values(1,4,1,3)")
	tk.MustExec("insert into supplier values(1, 1)")
	tk.MustExec("insert into orders values(1, 'F')")
	tk.MustExec("insert into nation values(1, 'EGYPT')")
	tk.MustExec("insert into lineitem values(2,0,1,2)")
	tk.MustExec("insert into lineitem values(2,1,3,4)")
	tk.MustExec("insert into lineitem values(2,2,2,0)")
	tk.MustExec("insert into lineitem values(2,3,3,1)")
	tk.MustExec("insert into lineitem values(2,4,4,3)")
	tk.MustExec("insert into supplier values(2, 3)")
	tk.MustExec("insert into orders values(2, 'F')")
	tk.MustExec("insert into nation values(2, 'EGYPT')")
	tk.MustExec("insert into lineitem values(3,0,4,3)")
	tk.MustExec("insert into lineitem values(3,1,4,3)")
	tk.MustExec("insert into lineitem values(3,2,2,2)")
	tk.MustExec("insert into lineitem values(3,3,0,0)")
	tk.MustExec("insert into lineitem values(3,4,1,0)")
	tk.MustExec("insert into supplier values(3, 1)")
	tk.MustExec("insert into orders values(3, 'F')")
	tk.MustExec("insert into nation values(3, 'EGYPT')")
	tk.MustExec("insert into lineitem values(4,0,2,2)")
	tk.MustExec("insert into lineitem values(4,1,4,2)")
	tk.MustExec("insert into lineitem values(4,2,0,2)")
	tk.MustExec("insert into lineitem values(4,3,0,1)")
	tk.MustExec("insert into lineitem values(4,4,2,2)")
	tk.MustExec("insert into supplier values(4, 4)")
	tk.MustExec("insert into orders values(4, 'F')")
	tk.MustExec("insert into nation values(4, 'EGYPT')")
	tk.MustQuery("select count(*) from supplier, lineitem l1, orders, nation where s_suppkey = l1.l_suppkey and o_orderkey = l1.l_orderkey and o_orderstatus = 'F' and  exists ( select * from lineitem l2 where l2.l_orderkey = l1.l_orderkey and l2.l_suppkey < l1.l_suppkey ) and s_nationkey = n_nationkey and n_name = 'EGYPT' order by l1.l_orderkey, l1.l_linenumber;").Check(testkit.Rows("18"))
	tk.MustExec("drop table lineitem")
	tk.MustExec("drop table nation")
	tk.MustExec("drop table supplier")
	tk.MustExec("drop table orders")
}

func TestIssue52902(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	// index hash join with semi join
	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/planner/core/MockOnlyEnableIndexHashJoinV2", "return(true)"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/planner/core/MockOnlyEnableIndexHashJoinV2"))
	}()
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t0")
	tk.MustExec("drop table if exists t1")
	tk.MustExec("create table t1 (x int, y int)")
	tk.MustExec("create table t0 (a int, b int, key (`b`))")
	tk.MustExec("insert into t1 values(103, 600)")
	tk.MustExec("insert into t1 values(100, 200)")
	tk.MustExec("insert into t0 values( 105, 400)")
	tk.MustExec("insert into t0 values( 104, 300)")
	tk.MustExec("insert into t0 values( 103, 300)")
	tk.MustExec("insert into t0 values( 102, 200)")
	tk.MustExec("insert into t0 values( 101, 200)")
	tk.MustExec("insert into t0 values( 100, 200)")
	tk.MustQuery("select * from t1 where 1 = 1 and case when t1.x < 1000 then 1 = 1 " +
		"when t1.x < 2000 then not exists (select 1 from t0 where t0.b = t1.y) else 1 = 1 end").Check(testkit.Rows("100 200", "103 600"))
}

func TestHashJoin(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1, t2")
	tk.MustExec("create table t1(a int, b int);")
	tk.MustExec("create table t2(a int, b int);")
	tk.MustExec("insert into t1 values(1,1),(2,2),(3,3),(4,4),(5,5);")
	tk.MustQuery("select count(*) from t1").Check(testkit.Rows("5"))
	tk.MustQuery("select count(*) from t2").Check(testkit.Rows("0"))
	tk.MustExec("set @@tidb_init_chunk_size=1;")
	result := tk.MustQuery("explain analyze select /*+ TIDB_HJ(t1, t2) */ * from t1 where exists (select a from t2 where t1.a = t2.a);")
	//   0                       1        2 3         4        5                                                                    6                                           7         8
	// 0 HashJoin_9              7992.00  0 root               time:959.436µs, loops:1, Concurrency:5, probe collision:0, build:0s  semi join, equal:[eq(test.t1.a, test.t2.a)] 0 Bytes   0 Bytes
	// 1 ├─TableReader_15(Build) 9990.00  0 root               time:583.499µs, loops:1, rpc num: 1, rpc time:563.325µs, proc keys:0 data:Selection_14                           141 Bytes N/A
	// 2 │ └─Selection_14        9990.00  0 cop[tikv]          time:53.674µs, loops:1                                               not(isnull(test.t2.a))                      N/A       N/A
	// 3 │   └─TableFullScan_13  10000.00 0 cop[tikv] table:t2 time:52.14µs, loops:1                                                keep order:false, stats:pseudo              N/A       N/A
	// 4 └─TableReader_12(Probe) 9990.00  5 root               time:779.503µs, loops:1, rpc num: 1, rpc time:794.929µs, proc keys:0 data:Selection_11                           241 Bytes N/A
	// 5   └─Selection_11        9990.00  5 cop[tikv]          time:243.395µs, loops:6                                              not(isnull(test.t1.a))                      N/A       N/A
	// 6     └─TableFullScan_10  10000.00 5 cop[tikv] table:t1 time:206.273µs, loops:6                                              keep order:false, stats:pseudo              N/A       N/A
	row := result.Rows()
	require.Equal(t, 7, len(row))
	innerActRows := row[1][2].(string)
	require.Equal(t, "0", innerActRows)
	outerActRows := row[4][2].(string)
	// FIXME: revert this result to 1 after TableReaderExecutor can handle initChunkSize.
	require.Equal(t, "5", outerActRows)
}

func TestOuterTableBuildHashTableIsuse13933(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t, s")
	tk.MustExec("create table t (a int,b int)")
	tk.MustExec("create table s (a int,b int)")
	tk.MustExec("insert into t values (11,11),(1,2)")
	tk.MustExec("insert into s values (1,2),(2,1),(11,11)")
	tk.MustQuery("select /*+ HASH_JOIN_BUILD(t) */ * from t left join s on s.a > t.a").Sort().Check(testkit.Rows("1 2 11 11", "1 2 2 1", "11 11 <nil> <nil>"))
	tk.MustQuery("explain format = 'brief' select /*+ HASH_JOIN_BUILD(t) */ * from t left join s on s.a > t.a").Check(testkit.Rows(
		"HashJoin 99900000.00 root  CARTESIAN left outer join, left side:TableReader, other cond:gt(test.s.a, test.t.a)",
		"├─TableReader(Build) 10000.00 root  data:TableFullScan",
		"│ └─TableFullScan 10000.00 cop[tikv] table:t keep order:false, stats:pseudo",
		"└─TableReader(Probe) 9990.00 root  data:Selection",
		"  └─Selection 9990.00 cop[tikv]  not(isnull(test.s.a))",
		"    └─TableFullScan 10000.00 cop[tikv] table:s keep order:false, stats:pseudo"))
	tk.MustExec("drop table if exists t, s")
	tk.MustExec("Create table s (a int, b int, key(b))")
	tk.MustExec("Create table t (a int, b int, key(b))")
	tk.MustExec("Insert into s values (1,2),(2,1),(11,11)")
	tk.MustExec("Insert into t values (11,2),(1,2),(5,2)")
	tk.MustQuery("select /*+ INL_HASH_JOIN(s) */ * from t left join s on s.b=t.b and s.a < t.a;").Sort().Check(testkit.Rows("1 2 <nil> <nil>", "11 2 1 2", "5 2 1 2"))
	tk.MustQuery("explain format = 'brief' select /*+ INL_HASH_JOIN(s) */ * from t left join s on s.b=t.b and s.a < t.a;").Check(testkit.Rows(
		"IndexHashJoin 12475.01 root  left outer join, inner:IndexLookUp, left side:TableReader, outer key:test.t.b, inner key:test.s.b, equal cond:eq(test.t.b, test.s.b), other cond:lt(test.s.a, test.t.a)",
		"├─TableReader(Build) 10000.00 root  data:TableFullScan",
		"│ └─TableFullScan 10000.00 cop[tikv] table:t keep order:false, stats:pseudo",
		"└─IndexLookUp(Probe) 12475.01 root  ",
		"  ├─Selection(Build) 12487.50 cop[tikv]  not(isnull(test.s.b))",
		"  │ └─IndexRangeScan 12500.00 cop[tikv] table:s, index:b(b) range: decided by [eq(test.s.b, test.t.b)], keep order:false, stats:pseudo",
		"  └─Selection(Probe) 12475.01 cop[tikv]  not(isnull(test.s.a))",
		"    └─TableRowIDScan 12487.50 cop[tikv] table:s keep order:false, stats:pseudo"))
}

func TestInlineProjection4HashJoinIssue15316(t *testing.T) {
	// Two necessary factors to reproduce this issue:
	// (1) taking HashLeftJoin, i.e., letting the probing tuple lay at the left side of joined tuples
	// (2) the projection only contains a part of columns from the build side, i.e., pruning the same probe side
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists S, T")
	tk.MustExec("create table S (a int not null, b int, c int);")
	tk.MustExec("create table T (a int not null, b int, c int);")
	tk.MustExec("insert into S values (0,1,2),(0,1,null),(0,1,2);")
	tk.MustExec("insert into T values (0,10,2),(0,10,null),(1,10,2);")
	tk.MustQuery("select /*+ HASH_JOIN_BUILD(T) */ T.a,T.a,T.c from S join T on T.a = S.a where S.b<T.b order by T.a,T.c;").Check(testkit.Rows(
		"0 0 <nil>",
		"0 0 <nil>",
		"0 0 <nil>",
		"0 0 2",
		"0 0 2",
		"0 0 2",
	))
	// NOTE: the HashLeftJoin should be kept
	tk.MustQuery("explain format = 'brief' select /*+ HASH_JOIN_BUILD(T) */ T.a,T.a,T.c from S join T on T.a = S.a where S.b<T.b order by T.a,T.c;").Check(testkit.Rows(
		"Projection 12487.50 root  test.t.a, test.t.a, test.t.c",
		"└─Sort 12487.50 root  test.t.a, test.t.c",
		"  └─HashJoin 12487.50 root  inner join, equal:[eq(test.s.a, test.t.a)], other cond:lt(test.s.b, test.t.b)",
		"    ├─TableReader(Build) 9990.00 root  data:Selection",
		"    │ └─Selection 9990.00 cop[tikv]  not(isnull(test.t.b))",
		"    │   └─TableFullScan 10000.00 cop[tikv] table:T keep order:false, stats:pseudo",
		"    └─TableReader(Probe) 9990.00 root  data:Selection",
		"      └─Selection 9990.00 cop[tikv]  not(isnull(test.s.b))",
		"        └─TableFullScan 10000.00 cop[tikv] table:S keep order:false, stats:pseudo"))
}

func TestIssue18572_1(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1")
	tk.MustExec("create table t1(a int, b int, index idx(b));")
	tk.MustExec("insert into t1 values(1, 1);")
	tk.MustExec("insert into t1 select * from t1;")

	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/testIndexHashJoinInnerWorkerErr", "return"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/testIndexHashJoinInnerWorkerErr"))
	}()

	rs, err := tk.Exec("select /*+ inl_hash_join(t1) */ * from t1 right join t1 t2 on t1.b=t2.b;")
	require.NoError(t, err)
	_, err = session.GetRows4Test(context.Background(), nil, rs)
	require.True(t, strings.Contains(err.Error(), "mockIndexHashJoinInnerWorkerErr"))
	require.NoError(t, rs.Close())
}

func TestIssue18572_2(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1")
	tk.MustExec("create table t1(a int, b int, index idx(b));")
	tk.MustExec("insert into t1 values(1, 1);")
	tk.MustExec("insert into t1 select * from t1;")

	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/testIndexHashJoinOuterWorkerErr", "return"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/testIndexHashJoinOuterWorkerErr"))
	}()

	rs, err := tk.Exec("select /*+ inl_hash_join(t1) */ * from t1 right join t1 t2 on t1.b=t2.b;")
	require.NoError(t, err)
	_, err = session.GetRows4Test(context.Background(), nil, rs)
	require.True(t, strings.Contains(err.Error(), "mockIndexHashJoinOuterWorkerErr"))
	require.NoError(t, rs.Close())
}

func TestIssue18572_3(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1")
	tk.MustExec("create table t1(a int, b int, index idx(b));")
	tk.MustExec("insert into t1 values(1, 1);")
	tk.MustExec("insert into t1 select * from t1;")

	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/testIndexHashJoinBuildErr", "return"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/testIndexHashJoinBuildErr"))
	}()

	rs, err := tk.Exec("select /*+ inl_hash_join(t1) */ * from t1 right join t1 t2 on t1.b=t2.b;")
	require.NoError(t, err)
	_, err = session.GetRows4Test(context.Background(), nil, rs)
	require.True(t, strings.Contains(err.Error(), "mockIndexHashJoinBuildErr"))
	require.NoError(t, rs.Close())
}

func TestExplainAnalyzeJoin(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1,t2;")
	tk.MustExec("create table t1 (a int, b int, unique index (a));")
	tk.MustExec("create table t2 (a int, b int, unique index (a))")
	tk.MustExec("insert into t1 values (1,1),(2,2),(3,3),(4,4),(5,5)")
	tk.MustExec("insert into t2 values (1,1),(2,2),(3,3),(4,4),(5,5)")
	// Test for index lookup join.
	rows := tk.MustQuery("explain analyze select /*+ INL_JOIN(t1, t2) */ * from t1,t2 where t1.a=t2.a;").Rows()
	require.Equal(t, 8, len(rows))
	require.Regexp(t, "IndexJoin_.*", rows[0][0])
	require.Regexp(t, "time:.*, loops:.*, inner:{total:.*, concurrency:.*, task:.*, construct:.*, fetch:.*, build:.*}, probe:.*", rows[0][5])
	// Test for index lookup hash join.
	rows = tk.MustQuery("explain analyze select /*+ INL_HASH_JOIN(t1, t2) */ * from t1,t2 where t1.a=t2.a;").Rows()
	require.Equal(t, 8, len(rows))
	require.Regexp(t, "IndexHashJoin.*", rows[0][0])
	require.Regexp(t, "time:.*, open:.*, close:.*, loops:.*, inner:{total:.*, concurrency:.*, task:.*, construct:.*, fetch:.*, build:.*, join:.*}", rows[0][5])
	// Test for hash join.
	rows = tk.MustQuery("explain analyze select /*+ HASH_JOIN(t1, t2) */ * from t1,t2 where t1.a=t2.a;").Rows()
	require.Equal(t, 7, len(rows))
	require.Regexp(t, "HashJoin.*", rows[0][0])
	require.Regexp(t, "time:.*, open:.*, close:.*, loops:.*, build_hash_table:{concurrency:.*, time:.*, fetch:.*, max_partition:.*, total_partition:.*, max_build:.*, total_build:.*}, probe:{concurrency:.*, time:.*, fetch_and_wait:.*, max_worker_time:.*, total_worker_time:.*, max_probe:.*, total_probe:.*}", rows[0][5])

	// TestExplainAnalyzeIndexHashJoin
	// Issue 43597
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("create table t (a int, index idx(a));")
	sql := "insert into t values"
	for i := 0; i <= 1024; i++ {
		if i != 0 {
			sql += ","
		}
		sql += fmt.Sprintf("(%d)", i)
	}
	tk.MustExec(sql)
	for i := 0; i <= 10; i++ {
		// Test for index lookup hash join.
		rows := tk.MustQuery("explain analyze select /*+ INL_HASH_JOIN(t1, t2) */ * from t t1 join t t2 on t1.a=t2.a limit 1;").Rows()
		require.Equal(t, 7, len(rows))
		require.Regexp(t, "IndexHashJoin.*", rows[1][0])
		// When innerWorkerRuntimeStats.join is negative, `join:` will not print.
		require.Regexp(t, "time:.*, open:.*, close:.*, loops:.*, inner:{total:.*, concurrency:.*, task:.*, construct:.*, fetch:.*, build:.*, join:.*}", rows[1][5])
	}
}

func TestIssue20270(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t;")
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("create table t(c1 int, c2 int)")
	tk.MustExec("create table t1(c1 int, c2 int)")
	tk.MustExec("insert into t values(1,1),(2,2)")
	tk.MustExec("insert into t1 values(2,3),(4,4)")
	tk.MustExec(join.DisableHashJoinV2)
	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/killedInJoin2Chunk", "return(true)"))
	err := tk.QueryToErr("select /*+ HASH_JOIN(t, t1) */ * from t left join t1 on t.c1 = t1.c1 where t.c1 = 1 or t1.c2 > 20")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/killedInJoin2Chunk"))
	err = failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/killedInJoin2ChunkForOuterHashJoin", "return(true)")
	require.NoError(t, err)
	tk.MustExec("insert into t1 values(1,30),(2,40)")
	err = tk.QueryToErr("select /*+ HASH_JOIN_BUILD(t) */ * from t left outer join t1 on t.c1 = t1.c1 where t.c1 = 1 or t1.c2 > 20")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	err = failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/killedInJoin2ChunkForOuterHashJoin")
	require.NoError(t, err)
}

func TestIssue31129(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("set @@tidb_init_chunk_size=2")
	tk.MustExec("set @@tidb_index_join_batch_size=10")
	tk.MustExec("DROP TABLE IF EXISTS t, s")
	tk.Session().GetSessionVars().EnableClusteredIndex = vardef.ClusteredIndexDefModeIntOnly
	tk.MustExec("create table t(pk int primary key, a int)")
	for i := range 100 {
		tk.MustExec(fmt.Sprintf("insert into t values(%d, %d)", i, i))
	}
	tk.MustExec("create table s(a int primary key)")
	for i := range 100 {
		tk.MustExec(fmt.Sprintf("insert into s values(%d)", i))
	}
	tk.MustExec("analyze table t")
	tk.MustExec("analyze table s")

	// Test IndexNestedLoopHashJoin keepOrder.
	fpName := "github.com/pingcap/tidb/pkg/executor/join/TestIssue31129"
	require.NoError(t, failpoint.Enable(fpName, "return"))
	err := tk.QueryToErr("select /*+ INL_HASH_JOIN(s) */ * from t left join s on t.a=s.a order by t.pk")
	require.True(t, strings.Contains(err.Error(), "TestIssue31129"))
	require.NoError(t, failpoint.Disable(fpName))

	// Test IndexNestedLoopHashJoin build hash table panic.
	fpName = "github.com/pingcap/tidb/pkg/executor/join/IndexHashJoinBuildHashTablePanic"
	require.NoError(t, failpoint.Enable(fpName, `panic("IndexHashJoinBuildHashTablePanic")`))
	err = tk.QueryToErr("select /*+ INL_HASH_JOIN(s) */ * from t left join s on t.a=s.a order by t.pk")
	require.True(t, strings.Contains(err.Error(), "IndexHashJoinBuildHashTablePanic"))
	require.NoError(t, failpoint.Disable(fpName))

	// Test IndexNestedLoopHashJoin fetch inner fail.
	fpName = "github.com/pingcap/tidb/pkg/executor/join/IndexHashJoinFetchInnerResultsErr"
	require.NoError(t, failpoint.Enable(fpName, "return"))
	err = tk.QueryToErr("select /*+ INL_HASH_JOIN(s) */ * from t left join s on t.a=s.a order by t.pk")
	require.True(t, strings.Contains(err.Error(), "IndexHashJoinFetchInnerResultsErr"))
	require.NoError(t, failpoint.Disable(fpName))

	// Test IndexNestedLoopHashJoin build hash table panic and IndexNestedLoopHashJoin fetch inner fail at the same time.
	fpName1, fpName2 := "github.com/pingcap/tidb/pkg/executor/join/IndexHashJoinBuildHashTablePanic", "github.com/pingcap/tidb/pkg/executor/join/IndexHashJoinFetchInnerResultsErr"
	require.NoError(t, failpoint.Enable(fpName1, `panic("IndexHashJoinBuildHashTablePanic")`))
	require.NoError(t, failpoint.Enable(fpName2, "return"))
	err = tk.QueryToErr("select /*+ INL_HASH_JOIN(s) */ * from t left join s on t.a=s.a order by t.pk")
	require.True(t, strings.Contains(err.Error(), "IndexHashJoinBuildHashTablePanic"))
	require.NoError(t, failpoint.Disable(fpName1))
	require.NoError(t, failpoint.Disable(fpName2))
}

func TestFinalizeCurrentSegPanic(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)

	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1, t2")
	tk.MustExec("create table t1 (a int, b int, c int)")
	tk.MustExec("create table t2 (a int, b int, c int)")
	tk.MustExec("insert into t1 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec("insert into t2 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec(join.EnableHashJoinV2)
	fpName := "github.com/pingcap/tidb/pkg/executor/join/finalizeCurrentSegPanic"
	require.NoError(t, failpoint.Enable(fpName, "panic(\"finalizeCurrentSegPanic\")"))
	defer func() {
		require.NoError(t, failpoint.Disable(fpName))
	}()
	err := tk.QueryToErr("select /*+ hash_join(t1)*/ * from t1 join t2 on t1.a = t2.a and t1.b = t2.b")
	require.EqualError(t, err, "failpoint panic: finalizeCurrentSegPanic")
}

func TestSplitPartitionPanic(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)

	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1, t2")
	tk.MustExec("create table t1 (a int, b int, c int)")
	tk.MustExec("create table t2 (a int, b int, c int)")
	tk.MustExec("insert into t1 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec("insert into t2 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec(join.EnableHashJoinV2)
	fpName := "github.com/pingcap/tidb/pkg/executor/join/splitPartitionPanic"
	require.NoError(t, failpoint.Enable(fpName, "panic(\"splitPartitionPanic\")"))
	defer func() {
		require.NoError(t, failpoint.Disable(fpName))
	}()
	err := tk.QueryToErr("select /*+ hash_join(t1)*/ * from t1 join t2 on t1.a = t2.a and t1.b = t2.b")
	require.EqualError(t, err, "failpoint panic: splitPartitionPanic")
}

func TestProcessOneProbeChunkPanic(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)

	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1, t2")
	tk.MustExec("create table t1 (a int, b int, c int)")
	tk.MustExec("create table t2 (a int, b int, c int)")
	tk.MustExec("insert into t1 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec("insert into t2 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec(join.EnableHashJoinV2)
	fpName := "github.com/pingcap/tidb/pkg/executor/join/processOneProbeChunkPanic"
	require.NoError(t, failpoint.Enable(fpName, "panic(\"processOneProbeChunkPanic\")"))
	defer func() {
		require.NoError(t, failpoint.Disable(fpName))
	}()
	err := tk.QueryToErr("select /*+ hash_join(t1)*/ * from t1 join t2 on t1.a = t2.a and t1.b = t2.b")
	require.EqualError(t, err, "failpoint panic: processOneProbeChunkPanic")
}

func TestCreateTasksPanic(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)

	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1, t2")
	tk.MustExec("create table t1 (a int, b int, c int)")
	tk.MustExec("create table t2 (a int, b int, c int)")
	tk.MustExec("insert into t1 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec("insert into t2 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec(join.EnableHashJoinV2)
	fpName := "github.com/pingcap/tidb/pkg/executor/join/createTasksPanic"
	require.NoError(t, failpoint.Enable(fpName, "panic(\"createTasksPanic\")"))
	defer func() {
		require.NoError(t, failpoint.Disable(fpName))
	}()
	err := tk.QueryToErr("select /*+ hash_join(t1)*/ * from t1 join t2 on t1.a = t2.a and t1.b = t2.b")
	require.EqualError(t, err, "failpoint panic: createTasksPanic")
}

func TestBuildHashTablePanic(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)

	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1, t2")
	tk.MustExec("create table t1 (a int, b int, c int)")
	tk.MustExec("create table t2 (a int, b int, c int)")
	tk.MustExec("insert into t1 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec("insert into t2 values (1, 1, 1), (1, 2, 2), (2, 1, 3), (2, 2, 4)")
	tk.MustExec(join.EnableHashJoinV2)
	fpName := "github.com/pingcap/tidb/pkg/executor/join/buildHashTablePanic"
	require.NoError(t, failpoint.Enable(fpName, "panic(\"buildHashTablePanic\")"))
	defer func() {
		require.NoError(t, failpoint.Disable(fpName))
	}()
	err := tk.QueryToErr("select /*+ hash_join(t1)*/ * from t1 join t2 on t1.a = t2.a and t1.b = t2.b")
	require.EqualError(t, err, "failpoint panic: buildHashTablePanic")
}

func TestKillDuringProbe(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t;")
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("create table t(c1 int, c2 int)")
	tk.MustExec("create table t1(c1 int, c2 int)")
	tk.MustExec("insert into t values(1,1),(2,2)")
	tk.MustExec("insert into t1 values(2,3),(4,4)")
	tk.MustExec(join.EnableHashJoinV2)
	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/killedDuringProbe", "return(true)"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/killedDuringProbe"))
	}()
	// inner join
	err := tk.QueryToErr("select /*+ HASH_JOIN(t, t1) */ * from t join t1 on t.c1 = t1.c1")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	// left outer join with outer to build
	err = tk.QueryToErr("select /*+ HASH_JOIN(t, t1) */ * from t left join t1 on t.c1 = t1.c1 where t.c1 = 1 or t1.c2 > 20")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	// left outer join with inner to build
	err = tk.QueryToErr("select /*+ HASH_JOIN_BUILD(t) */ * from t left outer join t1 on t.c1 = t1.c1 where t.c1 = 1 or t1.c2 > 20")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	tk.MustExec("insert into t1 values(1,30),(2,40)")
	// left outer join with inner to build
	err = tk.QueryToErr("select /*+ HASH_JOIN_BUILD(t) */ * from t left outer join t1 on t.c1 = t1.c1 where t.c1 = 1 or t1.c2 > 20")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
}

func TestKillDuringBuild(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t;")
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("create table t(c1 int, c2 int)")
	tk.MustExec("create table t1(c1 int, c2 int)")
	tk.MustExec("insert into t values(1,1),(2,2)")
	tk.MustExec("insert into t1 values(2,3),(4,4)")
	tk.MustExec(join.EnableHashJoinV2)
	require.NoError(t, failpoint.Enable("github.com/pingcap/tidb/pkg/executor/join/killedDuringBuild", "return(true)"))
	defer func() {
		require.NoError(t, failpoint.Disable("github.com/pingcap/tidb/pkg/executor/join/killedDuringBuild"))
	}()
	// inner join
	err := tk.QueryToErr("select /*+ HASH_JOIN(t, t1) */ * from t join t1 on t.c1 = t1.c1")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	// left outer join with outer to build
	err = tk.QueryToErr("select /*+ HASH_JOIN(t, t1) */ * from t left join t1 on t.c1 = t1.c1")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
	// left outer join with inner to build
	err = tk.QueryToErr("select /*+ HASH_JOIN_BUILD(t) */ * from t left outer join t1 on t.c1 = t1.c1")
	require.Equal(t, exeerrors.ErrQueryInterrupted, err)
}

func TestIssue54755(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("drop table if exists t2;")
	tk.MustExec("create table t1(pk INTEGER AUTO_INCREMENT, col_int_nokey INTEGER, col_int_key INTEGER, col_varchar_key VARCHAR(1), col_varchar_nokey VARCHAR(1), PRIMARY KEY (pk), KEY (col_int_key), KEY (col_varchar_key, col_int_key))")
	tk.MustExec("create table t2(pk INTEGER AUTO_INCREMENT, col_int_nokey INTEGER, col_int_key INTEGER, col_varchar_key VARCHAR(1), col_varchar_nokey VARCHAR(1), PRIMARY KEY (pk), KEY (col_int_key), KEY (col_varchar_key, col_int_key))")
	tk.MustExec("insert into t1(col_int_key, col_int_nokey,col_varchar_key, col_varchar_nokey) values(4,2,'v','v'),(62,150,'v','v')")
	tk.MustExec("insert into t2(col_int_key, col_int_nokey,col_varchar_key, col_varchar_nokey) values(8,null,'x','x'),(7,8,'d','d')")
	tk.MustExec(join.EnableHashJoinV2)
	// right join
	tk.MustQuery("select max(SQ1_alias2.col_int_nokey) as SQ1_field1 from ( t2 as SQ1_alias1 right join t1 as SQ1_alias2 on ( SQ1_alias2.col_varchar_key = SQ1_alias1.col_varchar_nokey ))").Check(testkit.Rows("150"))
	// left join
	tk.MustQuery("select max(SQ1_alias2.col_int_nokey) as SQ1_field1 from ( t1 as SQ1_alias2 left join t2 as SQ1_alias1 on ( SQ1_alias2.col_varchar_key = SQ1_alias1.col_varchar_nokey ))").Check(testkit.Rows("150"))
}

func TestIssue55016(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t;")
	tk.MustExec("create table t(a varchar(10), b char(10))")
	tk.MustExec("insert into t values('aa','a')")
	for _, hashJoinV2 := range join.HashJoinV2Strings {
		tk.MustExec(hashJoinV2)
		tk.MustQuery("select count(*) from t t1 join t t2 on t1.a = t2.b and t2.a = t1.b").Check(testkit.Rows("0"))
	}
}

func TestIssue56214(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("drop table if exists t2;")
	tk.MustExec("drop table if exists t3;")
	tk.MustExec("create table t1(id int, value int)")
	tk.MustExec("create table t2(id int, value int)")
	tk.MustExec("create table t3(id int, value int)")
	tk.MustExec("insert into t1 values(1,2),(2,3),(3,4)")
	tk.MustExec("insert into t2 values(1,10),(1,1),(2,10),(2,10)")
	tk.MustExec("insert into t3 values(1,10),(1,20)")
	for _, hashJoinV2 := range join.HashJoinV2Strings {
		tk.MustExec(hashJoinV2)
		tk.MustQuery("select value, (select t1.id from t1 join t2 on t1.id = t2.id and t1.value < t2.value - t3.value + 3) d from t3 order by value").Check(testkit.Rows("10 1", "20 <nil>"))
	}
}

func TestIssue56825(t *testing.T) {
	store := testkit.CreateMockStore(t)
	tk := testkit.NewTestKit(t, store)
	tk.MustExec("use test")
	tk.MustExec("drop table if exists t1;")
	tk.MustExec("drop table if exists t2;")
	tk.MustExec("create table t1(id int, col1 int)")
	tk.MustExec("create table t2(id int, col1 int, col2 int, col3 int, col4 int, col5 int)")
	tk.MustExec("insert into t1 values(1,2),(2,3)")
	tk.MustExec("insert into t2 values(1,2,3,4,5,6),(3,4,5,6,7,8),(4,5,6,7,8,9)")
	tk.MustExec("analyze table t1")
	tk.MustExec("analyze table t2")
	// t1 as build side
	for _, hashJoinV2 := range join.HashJoinV2Strings {
		tk.MustExec(hashJoinV2)
		tk.MustQuery("select * from t1 left join t2 on t1.id = t2.id and t1.col1 <= t2.col1 order by t1.id").Check(testkit.Rows("1 2 1 2 3 4 5 6", "2 3 <nil> <nil> <nil> <nil> <nil> <nil>"))
		tk.MustQuery("select * from t1 right join t2 on t1.id = t2.id and t1.col1 <= t2.col1 order by t2.id").Check(testkit.Rows("1 2 1 2 3 4 5 6", "<nil> <nil> 3 4 5 6 7 8", "<nil> <nil> 4 5 6 7 8 9"))
	}
	tk.MustExec("insert into t1 values(10,20),(11,21),(12,22),(13,23),(14,24),(15,25)")
	tk.MustExec("analyze table t1")
	// t2 as build side
	for _, hashJoinV2 := range join.HashJoinV2Strings {
		tk.MustExec(hashJoinV2)
		tk.MustQuery("select * from t1 left join t2 on t1.id = t2.id and t1.col1 <= t2.col1 order by t1.id").Check(testkit.Rows(
			"1 2 1 2 3 4 5 6",
			"2 3 <nil> <nil> <nil> <nil> <nil> <nil>",
			"10 20 <nil> <nil> <nil> <nil> <nil> <nil>",
			"11 21 <nil> <nil> <nil> <nil> <nil> <nil>",
			"12 22 <nil> <nil> <nil> <nil> <nil> <nil>",
			"13 23 <nil> <nil> <nil> <nil> <nil> <nil>",
			"14 24 <nil> <nil> <nil> <nil> <nil> <nil>",
			"15 25 <nil> <nil> <nil> <nil> <nil> <nil>",
		))
		tk.MustQuery("select * from t1 right join t2 on t1.id = t2.id and t1.col1 <= t2.col1 order by t2.id").Check(testkit.Rows("1 2 1 2 3 4 5 6", "<nil> <nil> 3 4 5 6 7 8", "<nil> <nil> 4 5 6 7 8 9"))
	}
}
