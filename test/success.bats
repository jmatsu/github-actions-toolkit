load helper/test_helper

@test "success" {
  run github::success
  [ "$status" -eq 0 ]
}
