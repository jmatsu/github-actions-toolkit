load helper/test_helper

@test "debug log w/o any parameters" {
  message="hello world"
  result="$(github::debug "$message")"
  [ "$result" = "::debug::$message" ]
}

@test "debug log w/ file" {
  message="hello world"
  result="$(file=foo github::debug "$message")"
  [ "$result" = "::debug file=foo::$message" ]
}

@test "debug log w/ file, line" {
  message="hello world"
  result="$(file=foo line=10 github::debug "$message")"
  [ "$result" = "::debug file=foo,line=10::$message" ]
}

@test "debug log in a pipe w/o any parameters" {
  message="hello world"
  result="$(echo "$message" | github::debug)"
  [ "$result" = "::debug::$message" ]
}

@test "debug log in a pipe w/ file" {
  message="hello world"
  result="$(echo "$message" | file=foo github::debug)"
  [ "$result" = "::debug file=foo::$message" ]
}
