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

package skip

import (
	"testing"

	"github.com/pingcap/tidb/pkg/testkit/testflag"
)

// UnderShort skips the test if the -short flag is set.
func UnderShort(t *testing.T, args ...any) {
	t.Helper()
	if testing.Short() {
		t.Skip(append([]any{"disabled under -short"}, args...)...)
	}
}

// NotUnderLong skips the test if the -long flag is not set
func NotUnderLong(t *testing.T, args ...any) {
	t.Helper()
	if !testflag.Long() {
		t.Skip(append([]any{"disabled not under -short"}, args...)...)
	}
}
