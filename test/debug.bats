#!/usr/bin/env bats

load toolkit

@test "debug log w/o any parameters" {
  result="$(github::debug "hello")"
  [ "$result" = "::debug::hello" ]
}

@test "debug log w/ file" {
  result="$(file=foo github::debug "hello")"
  echo $result
  [ "$result" = "::debug file=foo::hello" ]
}

@test "debug log w/ file, line" {
  result="$(file=foo line=10 github::debug "hello")"
  [ "$result" = "::debug file=foo,line=10::hello" ]
}

