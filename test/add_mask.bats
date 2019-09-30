load helper/test_helper

@test "add_mask" {
  value="hello world"
  result="$(github::add_mask "$value")"
  [ "$result" = "::add-mask::$value" ]
}

@test "add_mask in a pipe" {
  value="hello world"
  result="$(echo $value | github::add_mask)"
  [ "$result" = "::add-mask::$value" ]
}