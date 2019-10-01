#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::add_path "actions/add_path/bin1"
cat<<EOF | github::add_path
actions/add_path/bin2
actions/add_path/bin3
EOF