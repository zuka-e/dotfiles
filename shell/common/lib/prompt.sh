# shellcheck source=./log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"

# Ask the user to confirm a process with a yes/no question.
confirm() {
  local message="$1"

  while true; do
    read -r -p "$message (y/N) " input
    case "$input" in
      y | yes)
        return 0
        ;;
      N | no | No | '')
        print_default 'Cancelled.'
        return 1
        ;;
      *)
        print_default 'Please answer with y or N.'
        ;;
    esac
  done
}
