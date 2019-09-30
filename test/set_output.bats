load helper/test_helper

@test "set_output - a name contains a space and double-quoted" {
  name="var 1"
  value="hello world"
  result="$(github::set_output "$name" "$value")"
  [ "$result" = "::set-output name=var 1::$value" ]
}

@test "set_output - a name contains a space and double-unquoted" {
  name="var 1"
  value="hello world"
  result="$(github::set_output $name "$value")"
  [ "$result" = "::set-output name=var::1 $value" ]
}

@test "set_output in a pipe" {
  name="var 1"
  value="hello world"
  tmp_result=$(mktemp)
  cat<<EOF | github::set_output > $tmp_result
var 1 $value
var_2 $value
EOF

  [ "$(head -1 $tmp_result)" = "::set-output name=var::1 $value" ]
  [ "$(head -2 $tmp_result | tail -1)" = "::set-output name=var_2::$value" ]
}
