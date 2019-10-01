#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::debug "can you see me?"
cat<<EOF | github::debug
line1
line2
EOF