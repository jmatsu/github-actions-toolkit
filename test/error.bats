load helper/test_helper

@test "error log w/o any parameters" {
  message="hello world"
  result="$(github::error "$message")"
  [ "$result" = "::error::$message" ]
}

@test "error log w/ file" {
  message="hello world"
  result="$(file=foo github::error "$message")"
  [ "$result" = "::error file=foo::$message" ]
}

@test "error log w/ file, line" {
  message="hello world"
  result="$(file=foo line=10 github::error "$message")"
  [ "$result" = "::error file=foo,line=10::$message" ]
}

@test "error log w/ file, line, col" {
  message="hello world"
  result="$(file=foo line=10 col=20 github::error "$message")"
  [ "$result" = "::error file=foo,line=10,col=20::$message" ]
}

@test "error log in a pipe w/o any parameters" {
  message="hello world"
  result="$(echo "$message" | github::error)"
  [ "$result" = "::error::$message" ]
}

@test "error log in a pipe w/ file" {
  message="hello world"
  result="$(echo "$message" | file=foo github::error)"
  [ "$result" = "::error file=foo::$message" ]
}

@test "error log in a pipe w/ file, line" {
  message="hello world"
  result="$(echo "$message" | file=foo line=10 github::error)"
  [ "$result" = "::error file=foo,line=10::$message" ]
}

@test "error log in a pipe w/ file, line, col" {
  message="hello world"
  result="$(echo "$message" | file=foo line=10 col=20 github::error)"
  [ "$result" = "::error file=foo,line=10,col=20::$message" ]
}
