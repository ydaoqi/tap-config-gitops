#!/bin/bash
set -euxo pipefail
pushd $1

# Check that TAP files exist
test -f config/workload.yaml
test -f Tiltfile
test -f .tanzuignore

# Check that Kubernetes files don't exist
test ! -f kubernetes/deployment.yaml
test ! -f kubernetes/service.yaml

./mvnw package

popd