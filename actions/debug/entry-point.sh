#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::debug "can you see me?"
file=entry-point.sh github::debug "can you see me? with file"
file=entry-point.sh line=9 github::debug "can you see me? with file, line"

cat<<EOF | github::debug
line1
line2
EOF

cat<<EOF | file=entry-point.sh github::debug
file
EOF

cat<<EOF | file=entry-point.sh line=10 github::debug
file
line
EOF
