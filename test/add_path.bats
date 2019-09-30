load helper/test_helper

@test "add_path - one parameter" {
  path1="/path1"
  result="$(github::add_path "$path1")"
  [ "$result" = "::add-path::$path1" ]
}

@test "add_path - multiple parameters" {
  path1="/path1"
  path2="/path1/path2"
  tmp_result=$(mktemp)
  github::add_path "$path1" "$path2" > $tmp_result
  [ "$(head -1 $tmp_result)" = "::add-path::$path1" ]
  [ "$(head -2 $tmp_result | tail -1)" = "::add-path::$path2" ]
}

@test "add_path - a path contains a space and double-quoted" {
  path1="/path 1"
  result="$(github::add_path "$path1")"
  [ "$result" = "::add-path::$path1" ]
}

@test "add_path - a path contains a space and double-unquoted" {
  path1="/path 1"
  tmp_result=$(mktemp)
  github::add_path $path1 > $tmp_result
  [ "$(head -1 $tmp_result)" = "::add-path::/path" ]
  [ "$(head -2 $tmp_result | tail -1)" = "::add-path::1" ]
}

@test "add_path in a pipe" {
  name="var 1"
  value="hello world"
  tmp_result=$(mktemp)
  cat<<EOF | github::add_path > $tmp_result
/path1
/path 2
EOF

  [ "$(head -1 $tmp_result)" = "::add-path::/path1" ]
  [ "$(head -2 $tmp_result | tail -1)" = "::add-path::/path" ]
  [ "$(head -3 $tmp_result | tail -1)" = "::add-path::2" ]
}
