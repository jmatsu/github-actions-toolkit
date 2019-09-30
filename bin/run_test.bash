#!/usr/bin/env bash

set -eu

docker run -it -v "$(pwd):/code" --workdir=/code bats/bats:v1.1.0 "${1:-test}"