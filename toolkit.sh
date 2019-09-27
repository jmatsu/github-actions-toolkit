_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME='toolkit.sh'

_github::log() {
  # Usage: _github::log "debug" "any logging message"

  if (($# < 2)); then
    echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires log command type and the log message body"
    return 0
  fi

  local log_command="::$1"; shift 1

  if [[ -n "${file:-}" ]]; then
    log_command="$log_command file=$file"

    if [[ -n "${line:-}" ]]; then
      log_command="$log_command,line=$line"

      if [[ -n "${col:-}" ]]; then
        log_command="$log_command,col=$col"
      fi
    fi
  fi

  if [[ -p /dev/stdin ]]; then
    local log_line=
    while read log_line; do
      echo "$log_command::$log_line"
    done < <(cat -)
  else
    echo "$log_command::$@"
  fi
}

github::debug() {
  local -r log_command="$(echo $0 | sed -e 's/github:://')"

  if [[ -p /dev/stdin ]]; then
    cat - | github::log "$log_command"
  else
    if (($# < 1)); then
      echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires the log message body"
      return 0
    fi

    _github::log "$log_command" "$@"
  fi
}

github::warning() {
  local -r log_command="$(echo $0 | sed -e 's/github:://')"

  if [[ -p /dev/stdin ]]; then
    cat - | github::log "$log_command"
  else
    if (($# < 1)); then
      echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires the log message body"
      return 0
    fi

    _github::log "$log_command" "$@"
  fi
}

github::error() {
  local -r log_command="$(echo $0 | sed -e 's/github:://')"

  if [[ -p /dev/stdin ]]; then
    cat - | github::log "$log_command"
  else
    if (($# < 1)); then
      echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires the log message body"
      return 0
    fi

    _github::log "$log_command" "$@"
  fi
}

github::add_mask() {
  local masked_value=

  if [[ -p /dev/stdin ]]; then
    masked_value="$(cat -)"
  else
    if (($# < 1)); then
      echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires the value which will be masked"
      return 0
    fi

    masked_value="$1"
  fi

  if [[ -z "$masked_value" ]]; then
    file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME github::warning "the given value is empty so this action has no effect"
  fi

  echo "::add-mask::$masked_value"
}

_github::set_env() {
  local -r name="$1"; shift 1
  local -r value="$@"
  echo ::set-env "name=$name::$value"
}

github::set_env() {
  if [[ -p /dev/stdin ]]; then
    while read name value; do
      _github::set_env "$name" "$value"
    done < <(cat -)
  else
    _github::set_env "$@"
  fi
}

_github::set_output() {
  local -r name="$1"; shift 1
  local -r value="$@"
  echo ::set-output "name=$name::$value"
}

github::set_output() {
  if [[ -p /dev/stdin ]]; then
    while read name value; do
      _github::set_output "$name" "$value"
    done < <(cat -)
  else
    _github::set_output "$@"
  fi
}

github::add_path() {
  local paths= path=

  if [[ -p /dev/stdin ]]; then
    paths=($(cat -))
  else
    paths=("$@")
  fi

  for path in "${paths[@]}"; do
    if [[ -n "$path" ]]; then
      echo "::add-path::$path"
    fi
  done
}

github::stop_commands() {
  if (($# < 1)); then
    echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires a token which must be the first argument."
    return 0
  fi

  local -r token="$1"
  echo "::stop-commands::$token"
}

github::resume_commands() {
  if (($# < 1)); then
    echo "::debug file=$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME::$0 requires a token which must be the first argument."
    return 0
  fi

  local -r token="$1"
  echo "::$token::"
}

github::success() {
  file="$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME" github::debug "Exit with zero code via $0"
  exit 0
}

github::failure() {
  local -r exit_status="${1:-1}"
  file="$_GITHUB_ACTIONS_TOOLKIT___MY_FILE_NAME" github::debug "Exit with non-zero code ($exit_status) via $0"
  exit $exit_status
}