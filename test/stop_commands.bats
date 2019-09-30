load helper/test_helper

@test "stop_commands - a token contains a space and double-quoted" {
  token="a token"
  result="$(github::stop_commands "$token")"
  [ "$result" = "::stop-commands::$token" ]
}

@test "stop_commands - a token contains a space and double-unquoted" {
  token="a token"
  result="$(github::stop_commands $token)"
  [ "$result" = "::stop-commands::a" ]
}
