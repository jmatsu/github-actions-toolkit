#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::warning "can you see me?"
file=entry-point.sh github::warning "can you see me? with file"
file=entry-point.sh line=9 github::warning "can you see me? with file, line"
file=entry-point.sh line=10 col=12 github::warning "can you see me? with file, col"

cat<<EOF | github::warning
line1
line2
EOF

cat<<EOF | file=entry-point.sh github::warning
file
EOF

cat<<EOF | file=entry-point.sh line=10 github::warning
file
line
EOF

cat<<EOF | file=entry-point.sh line=10 col=12 github::warning
file
line
col
EOF