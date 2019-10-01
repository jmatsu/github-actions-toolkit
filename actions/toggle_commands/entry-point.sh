#!/usr/bin/env bash

set -eu

source /toolkit.sh

github::warning "this log should be warning"

github::stop_commands "hello"

github::warning "this log should not be warning but a text"

github::resume_commands "hello"

github::warning "this log also should be warning"