#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::set_output "foo1" "bar1"
cat<<EOF | github::set_output
foo2 bar2
EOF