// Copyright 2020 PingCAP, Inc. Licensed under Apache-2.0.

package utils_test

import (
	"context"
	"fmt"
	"io"
	"math"
	"testing"
	"time"

	"github.com/pingcap/errors"
	berrors "github.com/pingcap/tidb/br/pkg/errors"
	"github.com/pingcap/tidb/br/pkg/utils"
	"github.com/stretchr/testify/require"
	"go.uber.org/multierr"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func TestBackoffWithSuccess(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewTiKVStoreBackoffStrategy(10, time.Nanosecond, time.Nanosecond, utils.NewDefaultContext())
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		switch counter {
		case 0:
			return status.Error(codes.Unavailable, "transport is closing")
		case 1:
			return berrors.ErrKVEpochNotMatch
		case 2:
			return nil
		}
		return nil
	}, backoffStrategy)
	require.Equal(t, 3, counter)
	require.NoError(t, err)
}

func TestBackoffWithUnknownErrorSuccess(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewTiKVStoreBackoffStrategy(10, time.Nanosecond, time.Nanosecond, utils.NewDefaultContext())
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		switch counter {
		case 0:
			return errors.New("unknown error: not in the allow list")
		case 1:
			return berrors.ErrKVEpochNotMatch
		}
		return nil
	}, backoffStrategy)
	require.Equal(t, 3, counter)
	require.NoError(t, err)
}

func TestBackoffWithFatalError(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewTiKVStoreBackoffStrategy(10, time.Nanosecond, time.Nanosecond, utils.NewDefaultContext())
	gRPCError := status.Error(codes.Unavailable, "transport is closing")
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		switch counter {
		case 0:
			return gRPCError // nolint:wrapcheck
		case 1:
			return berrors.ErrKVEpochNotMatch
		case 2:
			return berrors.ErrKVDownloadFailed
		case 3:
			return berrors.ErrKVRangeIsEmpty
		}
		return nil
	}, backoffStrategy)
	require.Equal(t, 4, counter)
	require.Equal(t, []error{
		gRPCError,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVDownloadFailed,
		berrors.ErrKVRangeIsEmpty,
	}, multierr.Errors(err))
}

func TestWithRetryReturnLastErr(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewTiKVStoreBackoffStrategy(10, time.Nanosecond, time.Nanosecond, utils.NewDefaultContext())
	gRPCError := status.Error(codes.Unavailable, "transport is closing")
	err := utils.WithRetryReturnLastErr(context.Background(), func() error {
		defer func() { counter++ }()
		switch counter {
		case 0:
			return gRPCError // nolint:wrapcheck
		case 1:
			return berrors.ErrKVEpochNotMatch
		case 2:
			return berrors.ErrKVDownloadFailed
		case 3:
			return berrors.ErrKVRangeIsEmpty
		}
		return nil
	}, backoffStrategy)
	require.Equal(t, 4, counter)
	require.ErrorIs(t, err, berrors.ErrKVRangeIsEmpty)
}

func TestBackoffWithFatalRawGRPCError(t *testing.T) {
	var counter int
	canceledError := status.Error(codes.Canceled, "context canceled")
	backoffStrategy := utils.NewTiKVStoreBackoffStrategy(10, time.Nanosecond, time.Nanosecond, utils.NewDefaultContext())
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		return canceledError // nolint:wrapcheck
	}, backoffStrategy)
	require.Equal(t, 1, counter)
	require.Equal(t, []error{canceledError}, multierr.Errors(err))
}

func TestBackoffWithRetryableError(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewTiKVStoreBackoffStrategy(10, time.Nanosecond, time.Nanosecond, utils.NewDefaultContext())
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		return berrors.ErrKVEpochNotMatch
	}, backoffStrategy)
	require.Equal(t, 10, counter)
	require.Equal(t, []error{
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
		berrors.ErrKVEpochNotMatch,
	}, multierr.Errors(err))
}

func TestPdBackoffWithRetryableError(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewAggressivePDBackoffStrategy()
	gRPCError := status.Error(codes.Unavailable, "transport is closing")
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		if counter == 2 {
			return io.EOF
		}
		if counter == 6 {
			return context.Canceled
		}
		return gRPCError
	}, backoffStrategy)
	require.Equal(t, 7, counter)
	require.Equal(t, []error{
		gRPCError,
		gRPCError,
		io.EOF,
		gRPCError,
		gRPCError,
		gRPCError,
		context.Canceled,
	}, multierr.Errors(err))
}

func TestNewImportSSTBackofferWithSucess(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewImportSSTBackoffStrategy()
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		if counter == 5 {
			return nil
		}
		return berrors.ErrKVDownloadFailed
	}, backoffStrategy)
	require.Equal(t, 6, counter)
	require.NoError(t, err)
}

func TestNewDownloadSSTBackofferWithCancel(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewDownloadSSTBackoffStrategy()
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		if counter == 3 {
			return context.Canceled
		}
		return berrors.ErrKVIngestFailed
	}, backoffStrategy)
	require.Equal(t, 4, counter)
	require.Equal(t, []error{
		berrors.ErrKVIngestFailed,
		berrors.ErrKVIngestFailed,
		berrors.ErrKVIngestFailed,
		context.Canceled,
	}, multierr.Errors(err))
}

func TestNewBackupSSTBackofferWithCancel(t *testing.T) {
	var counter int
	backoffStrategy := utils.NewBackupSSTBackoffStrategy()
	err := utils.WithRetry(context.Background(), func() error {
		defer func() { counter++ }()
		if counter == 3 {
			return context.Canceled
		}
		return berrors.ErrKVIngestFailed
	}, backoffStrategy)
	require.Equal(t, 4, counter)
	require.Equal(t, []error{
		berrors.ErrKVIngestFailed,
		berrors.ErrKVIngestFailed,
		berrors.ErrKVIngestFailed,
		context.Canceled,
	}, multierr.Errors(err))
}

func TestConstantBackoff(t *testing.T) {
	backedOff := func(t *testing.T) {
		backoffStrategy := utils.ConstantBackoff(10 * time.Millisecond)
		ctx, cancel := context.WithCancel(context.Background())
		i := 0
		ch := make(chan error)

		go func() {
			_, err := utils.WithRetryV2(ctx, backoffStrategy, func(ctx context.Context) (struct{}, error) {
				i += 1
				return struct{}{}, fmt.Errorf("%d times, no meaning", i)
			})
			ch <- err
		}()
		time.Sleep(100 * time.Millisecond)
		cancel()
		require.Error(t, <-ch)
		// Make sure we have backed off.
		require.Less(t, i, 20)
	}

	infRetry := func(t *testing.T) {
		backoffer := utils.ConstantBackoff(0)
		ctx := context.Background()
		i := math.MaxInt16

		_, err := utils.WithRetryV2(ctx, backoffer, func(ctx context.Context) (struct{}, error) {
			i -= 1
			if i == 0 {
				return struct{}{}, nil
			}
			return struct{}{}, fmt.Errorf("try %d more times", i)
		})
		require.NoError(t, err)
	}

	t.Run("backedOff", backedOff)
	t.Run("infRetry", infRetry)
}
