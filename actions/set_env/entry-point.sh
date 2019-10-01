#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::set_env "foo1" "bar1"
cat<<EOF | github::set_env
foo2 bar2
EOF