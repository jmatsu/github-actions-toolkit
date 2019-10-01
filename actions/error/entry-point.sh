#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::error "can you see me?"
file=entry-point.sh github::error "can you see me? with file"
file=entry-point.sh line=9 github::error "can you see me? with file, line"
file=entry-point.sh line=10 col=12 github::error "can you see me? with file, col"

cat<<EOF | github::error
line1
line2
EOF

cat<<EOF | file=entry-point.sh github::error
file
EOF

cat<<EOF | file=entry-point.sh line=10 github::error
file
line
EOF

cat<<EOF | file=entry-point.sh line=10 col=12 github::error
file
line
col
EOF