#!/usr/bin/env bash
# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

# install kubebuilder tools for tests
# shellcheck source=./test/infrastructure/docker/hack/fetch_bins.sh
source "$(dirname "$0")/fetch_bins.sh"
fetch_tools

# shellcheck source=./test/infrastructure/docker/hack/utils.sh
source "$(dirname "$0")/utils.sh"
# cd to the root path
cd_root_path

# run go test
export GO111MODULE=on
setup_envs && go test ./...
