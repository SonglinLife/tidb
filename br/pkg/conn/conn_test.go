// Copyright 2020 PingCAP, Inc. Licensed under Apache-2.0.

package conn_test

import (
	"context"
	"fmt"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/docker/go-units"
	"github.com/pingcap/errors"
	"github.com/pingcap/failpoint"
	"github.com/pingcap/kvproto/pkg/metapb"
	kvconfig "github.com/pingcap/tidb/br/pkg/config"
	"github.com/pingcap/tidb/br/pkg/conn"
	"github.com/pingcap/tidb/br/pkg/conn/util"
	"github.com/pingcap/tidb/br/pkg/pdutil"
	"github.com/pingcap/tidb/br/pkg/restore/split"
	"github.com/stretchr/testify/require"
	"go.uber.org/multierr"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func TestGetAllTiKVStoresWithRetryCancel(t *testing.T) {
	err := failpoint.Enable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-grpc-cancel", "1*return(true)")
	require.NoError(t, err)
	err = failpoint.Enable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-ctx-cancel", "1*return(true)")
	require.NoError(t, err)
	defer func() {
		err = failpoint.Disable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-grpc-cancel")
		require.NoError(t, err)
		err = failpoint.Disable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-ctx-cancel")
		require.NoError(t, err)
	}()
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	stores := []*metapb.Store{
		{
			Id:    1,
			State: metapb.StoreState_Up,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tiflash",
				},
			},
		},
		{
			Id:    2,
			State: metapb.StoreState_Offline,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tiflash",
				},
			},
		},
	}

	fpdc := split.NewFakePDClient(stores, false, nil)

	_, err = conn.GetAllTiKVStoresWithRetry(ctx, fpdc, util.SkipTiFlash)
	require.Error(t, err)
	errs := multierr.Errors(err)
	require.Equal(t, 1, len(errs))
	require.Equal(t, codes.Canceled, status.Code(errors.Cause(errs[0])))
}

func TestGetAllTiKVStoresWithUnknown(t *testing.T) {
	err := failpoint.Enable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-error", "1*return(true)")
	require.NoError(t, err)
	err = failpoint.Enable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-ctx-cancel", "1*return(true)")
	require.NoError(t, err)
	defer func() {
		err = failpoint.Disable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-error")
		require.NoError(t, err)
		err = failpoint.Disable("github.com/pingcap/tidb/br/pkg/conn/hint-GetAllTiKVStores-ctx-cancel")
		require.NoError(t, err)
	}()
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	stores := []*metapb.Store{
		{
			Id:    1,
			State: metapb.StoreState_Up,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tiflash",
				},
			},
		},
		{
			Id:    2,
			State: metapb.StoreState_Offline,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tiflash",
				},
			},
		},
	}

	fpdc := split.NewFakePDClient(stores, false, nil)

	_, err = conn.GetAllTiKVStoresWithRetry(ctx, fpdc, util.SkipTiFlash)
	require.Error(t, err)
	errs := multierr.Errors(err)
	require.Equal(t, 1, len(errs))
	require.Equal(t, codes.Unknown, status.Code(errors.Cause(errs[0])))
}

func TestCheckStoresAlive(t *testing.T) {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	stores := []*metapb.Store{
		{
			Id:    1,
			State: metapb.StoreState_Up,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tiflash",
				},
			},
		},
		{
			Id:    2,
			State: metapb.StoreState_Offline,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tiflash",
				},
			},
		},
		{
			Id:    3,
			State: metapb.StoreState_Up,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tikv",
				},
			},
		},
		{
			Id:    4,
			State: metapb.StoreState_Offline,
			Labels: []*metapb.StoreLabel{
				{
					Key:   "engine",
					Value: "tikv",
				},
			},
		},
	}

	fpdc := split.NewFakePDClient(stores, false, nil)

	kvStores, err := conn.GetAllTiKVStoresWithRetry(ctx, fpdc, util.SkipTiFlash)
	require.NoError(t, err)
	require.Len(t, kvStores, 2)
	require.Equal(t, stores[2:], kvStores)

	err = conn.CheckStoresAlive(ctx, fpdc, util.SkipTiFlash)
	require.NoError(t, err)
}

func TestGetAllTiKVStores(t *testing.T) {
	testCases := []struct {
		stores         []*metapb.Store
		storeBehavior  util.StoreBehavior
		expectedStores map[uint64]int
		expectedError  string
	}{
		{
			stores: []*metapb.Store{
				{Id: 1},
			},
			storeBehavior:  util.SkipTiFlash,
			expectedStores: map[uint64]int{1: 1},
		},
		{
			stores: []*metapb.Store{
				{Id: 1},
			},
			storeBehavior:  util.ErrorOnTiFlash,
			expectedStores: map[uint64]int{1: 1},
		},
		{
			stores: []*metapb.Store{
				{Id: 1},
				{Id: 2, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tiflash"}}},
			},
			storeBehavior:  util.SkipTiFlash,
			expectedStores: map[uint64]int{1: 1},
		},
		{
			stores: []*metapb.Store{
				{Id: 1},
				{Id: 2, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tiflash"}}},
			},
			storeBehavior: util.ErrorOnTiFlash,
			expectedError: "^cannot restore to a cluster with active TiFlash stores",
		},
		{
			stores: []*metapb.Store{
				{Id: 1},
				{Id: 2, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tiflash"}}},
				{Id: 3},
				{Id: 4, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tikv"}}},
				{Id: 5, Labels: []*metapb.StoreLabel{{Key: "else", Value: "tikv"}, {Key: "engine", Value: "tiflash"}}},
				{Id: 6, Labels: []*metapb.StoreLabel{{Key: "else", Value: "tiflash"}, {Key: "engine", Value: "tikv"}}},
			},
			storeBehavior:  util.SkipTiFlash,
			expectedStores: map[uint64]int{1: 1, 3: 1, 4: 1, 6: 1},
		},
		{
			stores: []*metapb.Store{
				{Id: 1},
				{Id: 2, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tiflash"}}},
				{Id: 3},
				{Id: 4, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tikv"}}},
				{Id: 5, Labels: []*metapb.StoreLabel{{Key: "else", Value: "tikv"}, {Key: "engine", Value: "tiflash"}}},
				{Id: 6, Labels: []*metapb.StoreLabel{{Key: "else", Value: "tiflash"}, {Key: "engine", Value: "tikv"}}},
			},
			storeBehavior: util.ErrorOnTiFlash,
			expectedError: "^cannot restore to a cluster with active TiFlash stores",
		},
		{
			stores: []*metapb.Store{
				{Id: 1},
				{Id: 2, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tiflash"}}},
				{Id: 3},
				{Id: 4, Labels: []*metapb.StoreLabel{{Key: "engine", Value: "tikv"}}},
				{Id: 5, Labels: []*metapb.StoreLabel{{Key: "else", Value: "tikv"}, {Key: "engine", Value: "tiflash"}}},
				{Id: 6, Labels: []*metapb.StoreLabel{{Key: "else", Value: "tiflash"}, {Key: "engine", Value: "tikv"}}},
			},
			storeBehavior:  util.TiFlashOnly,
			expectedStores: map[uint64]int{2: 1, 5: 1},
		},
	}

	for _, testCase := range testCases {
		pdClient := split.NewFakePDClient(testCase.stores, false, nil)
		stores, err := util.GetAllTiKVStores(context.Background(), pdClient, testCase.storeBehavior)
		if len(testCase.expectedError) != 0 {
			require.Error(t, err)
			require.Regexp(t, testCase.expectedError, err.Error())
			continue
		}
		foundStores := make(map[uint64]int)
		for _, store := range stores {
			foundStores[store.Id]++
		}
		require.Equal(t, testCase.expectedStores, foundStores)
	}
}

func TestGetConnOnCanceledContext(t *testing.T) {
	ctx, cancel := context.WithCancel(context.Background())
	cancel()

	mgr := &conn.Mgr{PdController: &pdutil.PdController{}}

	_, err := mgr.GetBackupClient(ctx, 42)
	require.Error(t, err)
	require.Contains(t, err.Error(), "context canceled")

	_, err = mgr.ResetBackupClient(ctx, 42)
	require.Error(t, err)
	require.Contains(t, err.Error(), "context canceled")
}

func TestGetMergeRegionSizeAndCount(t *testing.T) {
	cases := []struct {
		stores              []*metapb.Store
		content             []string
		importNumGoroutines uint
		regionSplitSize     uint64
		regionSplitKeys     uint64
	}{
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tiflash",
						},
					},
				},
			},
			content: []string{""},
			// no tikv detected in this case
			importNumGoroutines: conn.DefaultImportNumGoroutines,
			regionSplitSize:     conn.DefaultMergeRegionSizeBytes,
			regionSplitKeys:     conn.DefaultMergeRegionKeyCount,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tiflash",
						},
					},
				},
				{
					Id:    2,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"",
				// Assuming the TiKV has failed due to some reason.
				"",
			},
			// no tikv detected in this case
			importNumGoroutines: conn.DefaultImportNumGoroutines,
			regionSplitSize:     conn.DefaultMergeRegionSizeBytes,
			regionSplitKeys:     conn.DefaultMergeRegionKeyCount,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"{\"log-level\": \"debug\", \"coprocessor\": {\"region-split-keys\": 1, \"region-split-size\": \"1MiB\"}, \"import\": {\"num-threads\": 6}}",
			},
			// the number of import goroutines is 8 times than import.num-threads.
			importNumGoroutines: 48,
			// one tikv detected in this case we are not update default size and keys because they are too small.
			regionSplitSize: 1 * units.MiB,
			regionSplitKeys: 1,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"{\"log-level\": \"debug\", \"coprocessor\": {\"region-split-keys\": 10000000, \"region-split-size\": \"1GiB\"}, \"import\": {\"num-threads\": 128}}",
			},
			importNumGoroutines: 1024,
			// one tikv detected in this case and we update with new size and keys.
			regionSplitSize: 1 * units.GiB,
			regionSplitKeys: 10000000,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
				{
					Id:    2,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"{\"log-level\": \"debug\", \"coprocessor\": {\"region-split-keys\": 10000000, \"region-split-size\": \"1GiB\"}, \"import\": {\"num-threads\": 128}}",
				"{\"log-level\": \"debug\", \"coprocessor\": {\"region-split-keys\": 12000000, \"region-split-size\": \"900MiB\"}, \"import\": {\"num-threads\": 12}}",
			},
			// two tikv detected in this case and we choose the small one.
			importNumGoroutines: 96,
			regionSplitSize:     1 * units.GiB,
			regionSplitKeys:     10000000,
		},
	}

	pctx := context.Background()
	for _, ca := range cases {
		ctx, cancel := context.WithCancel(pctx)
		pdCli := split.NewFakePDClient(ca.stores, false, nil)
		require.Equal(t, len(ca.content), len(ca.stores))
		count := 0
		mockServer := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			switch strings.TrimSpace(r.URL.Path) {
			case "/config":
				if len(ca.content[count]) == 0 {
					cancel()
				}
				_, _ = fmt.Fprint(w, ca.content[count])
			default:
				http.NotFoundHandler().ServeHTTP(w, r)
			}
			count++
		}))

		for _, s := range ca.stores {
			s.Address = mockServer.URL
			s.StatusAddress = mockServer.URL
		}

		httpCli := mockServer.Client()
		mgr := &conn.Mgr{PdController: &pdutil.PdController{}}
		mgr.PdController.SetPDClient(pdCli)
		kvConfigs := &kvconfig.KVConfig{
			ImportGoroutines:    kvconfig.ConfigTerm[uint]{Value: conn.DefaultImportNumGoroutines, Modified: false},
			MergeRegionSize:     kvconfig.ConfigTerm[uint64]{Value: conn.DefaultMergeRegionSizeBytes, Modified: false},
			MergeRegionKeyCount: kvconfig.ConfigTerm[uint64]{Value: conn.DefaultMergeRegionKeyCount, Modified: false},
		}
		mgr.ProcessTiKVConfigs(ctx, kvConfigs, httpCli)
		require.EqualValues(t, ca.regionSplitSize, kvConfigs.MergeRegionSize.Value)
		require.EqualValues(t, ca.regionSplitKeys, kvConfigs.MergeRegionKeyCount.Value)
		require.EqualValues(t, ca.importNumGoroutines, kvConfigs.ImportGoroutines.Value)
		mockServer.Close()
	}
}

func TestIsLogBackupEnabled(t *testing.T) {
	cases := []struct {
		stores  []*metapb.Store
		content []string
		enable  bool
		err     bool
	}{
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tiflash",
						},
					},
				},
			},
			content: []string{""},
			enable:  true,
			err:     false,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tiflash",
						},
					},
				},
				{
					Id:    2,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"",
				// Assuming the TiKV has failed due to some reason.
				"",
			},
			enable: false,
			err:    true,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"{\"log-level\": \"debug\", \"log-backup\": {\"enable\": true}}",
			},
			enable: true,
			err:    false,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"{\"log-level\": \"debug\", \"log-backup\": {\"enable\": false}}",
			},
			enable: false,
			err:    false,
		},
		{
			stores: []*metapb.Store{
				{
					Id:    1,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
				{
					Id:    2,
					State: metapb.StoreState_Up,
					Labels: []*metapb.StoreLabel{
						{
							Key:   "engine",
							Value: "tikv",
						},
					},
				},
			},
			content: []string{
				"{\"log-level\": \"debug\", \"log-backup\": {\"enable\": true}}",
				"{\"log-level\": \"debug\", \"log-backup\": {\"enable\": false}}",
			},
			enable: false,
			err:    false,
		},
	}

	pctx := context.Background()
	for _, ca := range cases {
		ctx, cancel := context.WithCancel(pctx)
		pdCli := split.NewFakePDClient(ca.stores, false, nil)
		require.Equal(t, len(ca.content), len(ca.stores))
		count := 0
		mockServer := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			switch strings.TrimSpace(r.URL.Path) {
			case "/config":
				if len(ca.content[count]) == 0 {
					cancel()
				}
				_, _ = fmt.Fprint(w, ca.content[count])
			default:
				http.NotFoundHandler().ServeHTTP(w, r)
			}
			count++
		}))

		for _, s := range ca.stores {
			s.Address = mockServer.URL
			s.StatusAddress = mockServer.URL
		}

		httpCli := mockServer.Client()
		mgr := &conn.Mgr{PdController: &pdutil.PdController{}}
		mgr.PdController.SetPDClient(pdCli)
		enable, err := mgr.IsLogBackupEnabled(ctx, httpCli)
		if ca.err {
			require.Error(t, err)
		} else {
			require.NoError(t, err)
			require.Equal(t, ca.enable, enable)
		}
		mockServer.Close()
	}
}

func TestHandleTiKVAddress(t *testing.T) {
	cases := []struct {
		store      *metapb.Store
		httpPrefix string
		result     string
	}{
		{
			store: &metapb.Store{
				Id:            1,
				State:         metapb.StoreState_Up,
				Address:       "127.0.0.1:20160",
				StatusAddress: "127.0.0.1:20180",
			},
			httpPrefix: "http://",
			result:     "http://127.0.0.1:20180",
		},
		{
			store: &metapb.Store{
				Id:            1,
				State:         metapb.StoreState_Up,
				Address:       "[::1]:20160",
				StatusAddress: "[::1]:20180",
			},
			httpPrefix: "http://",
			result:     "http://[::1]:20180",
		},
		{
			store: &metapb.Store{
				Id:            1,
				State:         metapb.StoreState_Up,
				Address:       "192.168.1.5:20160",
				StatusAddress: "0.0.0.0:20180",
			},
			httpPrefix: "https://",
			// if status address and node address not match, we use node address as default host name.
			result: "https://192.168.1.5:20180",
		},
		{
			store: &metapb.Store{
				Id:            1,
				State:         metapb.StoreState_Up,
				Address:       "[fd00::1:5]:20160",
				StatusAddress: "[::]:20180",
			},
			httpPrefix: "https://",
			// if status address and node address not match, we use node address as default host name.
			result: "https://[fd00::1:5]:20180",
		},
	}
	for _, ca := range cases {
		addr, err := conn.HandleTiKVAddress(ca.store, ca.httpPrefix)
		require.Nil(t, err)
		require.Equal(t, ca.result, addr.String())
	}
}
