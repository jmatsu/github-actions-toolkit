load helper/test_helper

@test "set_env - a name contains a space and double-quoted" {
  name="var 1"
  value="hello world"
  result="$(github::set_env "$name" "$value")"
  [ "$result" = "::set-env name=var 1::$value" ]
}

@test "set_env - a name contains a space and double-unquoted" {
  name="var 1"
  value="hello world"
  result="$(github::set_env $name "$value")"
  [ "$result" = "::set-env name=var::1 $value" ]
}

@test "set_env in a pipe" {
  name="var 1"
  value="hello world"
  tmp_result=$(mktemp)
  cat<<EOF | github::set_env > $tmp_result
var 1 $value
var_2 $value
EOF

  [ "$(head -1 $tmp_result)" = "::set-env name=var::1 $value" ]
  [ "$(head -2 $tmp_result | tail -1)" = "::set-env name=var_2::$value" ]
}
