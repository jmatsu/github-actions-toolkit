load helper/test_helper

@test "resume_commands - a token contains a space and double-quoted" {
  token="a token"
  result="$(github::resume_commands "$token")"
  [ "$result" = "::$token::" ]
}

@test "resume_commands - a token contains a space and double-unquoted" {
  token="a token"
  result="$(github::resume_commands $token)"
  [ "$result" = "::a::" ]
}
