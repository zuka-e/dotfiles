# shellcheck source=./color.sh
. "$SHELL_CONFIG_HOME/common/lib/color.sh"

LOG_DATE_FORMAT='%Y-%m-%d %H:%M:%S'

# Get the log directory.
log_dir() {
  printf '%s/logs\n' "${DOTFILES_PATH:-$HOME/dotfiles}"
}

# Output log to file.
log_to_file() {
  local level="$1"
  shift 1

  local timestamp
  timestamp="$(date "+${LOG_DATE_FORMAT}")"
  local log_file="${LOG_FILE:-"$(log_dir)/dotfiles.log"}"

  printf "%s [%s]: %s\n" "$timestamp" "$level" "$*" >> "$log_file"
}

# Print values with a log format with a color and write to a log file.
log_print() {
  local level="$1"
  shift 1

  alert_print "$level" "$@"
  log_to_file "$level" "$@"
}

# Print values with a INFO log format with a color and write to a log file.
log_print_info() {
  log_print INFO "$@"
}

# Print values with a WARN log format with a color and write to a log file.
log_print_warn() {
  log_print WARN "$@"
}

# Print values with a ERROR log format with a color and write to a log file.
log_print_error() {
  log_print ERROR "$@"
}
