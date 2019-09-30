load helper/test_helper

@test "failure" {
  run github::failure
  [ "$status" -eq 1 ]
}

@test "failure w/ status" {
  run github::failure 123
  [ "$status" -eq 123 ]
}
