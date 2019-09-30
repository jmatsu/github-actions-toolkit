load helper/test_helper

@test "warning log w/o any parameters" {
  message="hello world"
  result="$(github::warning "$message")"
  [ "$result" = "::warning::$message" ]
}

@test "warning log w/ file" {
  message="hello world"
  result="$(file=foo github::warning "$message")"
  [ "$result" = "::warning file=foo::$message" ]
}

@test "warning log w/ file, line" {
  message="hello world"
  result="$(file=foo line=10 github::warning "$message")"
  [ "$result" = "::warning file=foo,line=10::$message" ]
}

@test "warning log w/ file, line, col" {
  message="hello world"
  result="$(file=foo line=10 col=20 github::warning "$message")"
  [ "$result" = "::warning file=foo,line=10,col=20::$message" ]
}

@test "warning log in a pipe w/o any parameters" {
  message="hello world"
  result="$(echo "$message" | github::warning)"
  [ "$result" = "::warning::$message" ]
}

@test "warning log in a pipe w/ file" {
  message="hello world"
  result="$(echo "$message" | file=foo github::warning)"
  [ "$result" = "::warning file=foo::$message" ]
}

@test "warning log in a pipe w/ file, line" {
  message="hello world"
  result="$(echo "$message" | file=foo line=10 github::warning)"
  [ "$result" = "::warning file=foo,line=10::$message" ]
}

@test "warning log in a pipe w/ file, line, col" {
  message="hello world"
  result="$(echo "$message" | file=foo line=10 col=20 github::warning)"
  [ "$result" = "::warning file=foo,line=10,col=20::$message" ]
}
