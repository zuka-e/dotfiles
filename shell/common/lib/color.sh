: "${COLOR_INITIALIZED=false}"

# Foreground colors

: "${FG_BLACK-}"
: "${FG_RED=}"
: "${FG_GREEN=}"
: "${FG_YELLOW=}"
: "${FG_BLUE=}"
: "${FG_MAGENTA=}"
: "${FG_CYAN=}"
: "${FG_WHITE=}"
: "${FG_ORANGE=}"

# Text attributes

: "${TEXT_BOLD=}"
: "${TEXT_UNDERLINE=}"
: "${TEXT_REVERSE=}"
: "${TEXT_NEUTRAL=}"

# Initialize the color variables.
init_colors() {
  if [[ "$COLOR_INITIALIZED" == true ]]; then
    return
  fi

  if [[ -n "${NO_COLOR-}" || ! -t 2 ]]; then
    FG_BLACK=""
    FG_RED=""
    FG_GREEN=""
    FG_YELLOW=""
    FG_BLUE=""
    FG_MAGENTA=""
    FG_CYAN=""
    FG_WHITE=""
    FG_ORANGE=""
    TEXT_BOLD=""
    TEXT_UNDERLINE=""
    TEXT_REVERSE=""
    TEXT_NEUTRAL=""
    return
  fi

  # cf. https://linuxcommand.org/lc3_adv_tput.php
  if command -v tput > /dev/null 2>&1; then
    FG_BLACK="$(tput setaf 0)"
    FG_RED="$(tput setaf 1)"
    FG_GREEN="$(tput setaf 2)"
    FG_YELLOW="$(tput setaf 3)"
    FG_BLUE="$(tput setaf 4)"
    FG_MAGENTA="$(tput setaf 5)"
    FG_CYAN="$(tput setaf 6)"
    FG_WHITE="$(tput setaf 7)"
    TEXT_BOLD="$(tput bold)"
    TEXT_UNDERLINE="$(tput smul)"
    TEXT_REVERSE="$(tput rev)"
    TEXT_NEUTRAL="$(tput sgr0)"

    if [[ "$(tput colors)" == 256 ]]; then
      FG_ORANGE="$(tput setaf 208)"
    fi
  else
    # ※ `\033`(octal escape) is more portable than `\e`(ANSI escape).
    FG_BLACK='\033[30m'
    FG_RED='\033[31m'
    FG_GREEN='\033[32m'
    FG_YELLOW='\033[33m'
    FG_BLUE='\033[34m'
    FG_MAGENTA='\033[35m'
    FG_CYAN='\033[36m'
    FG_WHITE='\033[37m'
    TEXT_BOLD='\033[1m'
    TEXT_UNDERLINE='\033[4m'
    TEXT_REVERSE='\033[7m'
    TEXT_NEUTRAL='\033[0m'
  fi

  COLOR_INITIALIZED=true
}

#------------------------------------------------
# Print the value with a color
#------------------------------------------------

# Print the value with a color (and any other effect).
color_print() {
  init_colors

  local color="$1"
  shift 1

  printf '%b%s%b\n' "$color" "$*" "$TEXT_NEUTRAL"
}

# Print the value with red.
print_red() {
  color_print "$FG_RED" "$@"
}

# Print the value with bold red.
print_bold_red() {
  color_print "${TEXT_BOLD}${FG_RED}" "$@"
}

# Print the value with green.
print_green() {
  color_print "$FG_GREEN" "$@"
}

# Print the value with bold green.
print_bold_green() {
  color_print "${TEXT_BOLD}${FG_GREEN}" "$@"
}

# Print the value with yellow.
print_yellow() {
  color_print "$FG_YELLOW" "$@"
}

# Print the value with bold yellow.
print_bold_yellow() {
  color_print "${TEXT_BOLD}${FG_YELLOW}" "$@"
}

# Print the value with blue.
print_blue() {
  color_print "$FG_BLUE" "$@"
}

# Print the value with bold blue.
print_bold_blue() {
  color_print "${TEXT_BOLD}${FG_BLUE}" "$@"
}

# Print the value with magenta.
print_magenta() {
  color_print "$FG_MAGENTA" "$@"
}

# Print the value with bold magenta.
print_bold_magenta() {
  color_print "${TEXT_BOLD}${FG_MAGENTA}" "$@"
}

# Print the value with cyan.
print_cyan() {
  color_print "$FG_CYAN" "$@"
}

# Print the value with bold cyan.
print_bold_cyan() {
  color_print "${TEXT_BOLD}${FG_CYAN}" "$@"
}

# Print the value with default effect.
print_default() {
  color_print "$TEXT_NEUTRAL" "$@"
}

# Print the value with bold.
print_bold() {
  color_print "$TEXT_BOLD" "$@"
}

#------------------------------------------------
# Print the value with a colored alert level to stderr.
#------------------------------------------------

# Get the color associated with the alert.
get_alert_color() {
  local level="$1"
  local color=''

  case "$level" in
    INFO)
      color="$FG_BLUE"
      ;;
    WARN)
      color="$FG_YELLOW"
      ;;
    ERROR)
      color="$FG_RED"
      ;;
    SUCCESS | OK)
      color="$FG_GREEN"
      ;;
  esac

  printf '%b\n' "$color"
}

# Print the value with a prefix of a colored alert level to stderr.
alert_print() {
  init_colors

  local level="$1"
  shift 1

  local color
  color="$(get_alert_color "$level")"
  local effect="${TEXT_REVERSE}${TEXT_BOLD}${color}"

  printf '%b[%s]%b %s\n' \
    "$effect" \
    "$level" \
    "$TEXT_NEUTRAL" \
    "$*" >&2
}

# Print the value with a prefix of a colored "INFO" to stderr.
print_info() {
  alert_print INFO "$@"
}

# Print the value with a prefix of a colored "WARN" to stderr.
print_warn() {
  alert_print WARN "$@"
}

# Print the value with a prefix of a colored "ERROR" to stderr.
print_error() {
  alert_print ERROR "$@"
}

# Print the value with a prefix of a colored "SUCCESS" to stderr.
print_success() {
  alert_print SUCCESS "$@"
}

# Print the value with a prefix of a colored "OK" to stderr.
print_ok() {
  alert_print OK "$@"
}

#------------------------------------------------
# Initialize
#------------------------------------------------

init_colors
