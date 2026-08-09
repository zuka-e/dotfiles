# shellcheck source=./log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"

# Determine if it's Mac.
is_mac() {
  [[ "$(uname)" == 'Darwin' ]]
}

# Determine if it's Linux.
is_linux() {
  [[ "$(uname)" == 'Linux' ]]
}

# Determine if using dnf.
has_dnf() {
  command -v dnf > /dev/null
}

# Determine if using apt.
has_apt() {
  command -v apt > /dev/null
}

# Determine if using Apple silicon processor.
has_apple_silicon() {
  is_mac && [[ "$(uname -m)" == 'arm64' ]]
}

# Determine if the current shell is bash.
is_bash() {
  [[ -n "${BASH_VERSION-}" ]]
}

# Determine if the current shell is zsh.
is_zsh() {
  [[ -n "${ZSH_VERSION-}" ]]
}

# Determine if the current shell is interactive.
is_interactive_shell() {
  if is_zsh; then
    [[ -o interactive ]]
    return
  fi

  [[ $- == *i* ]]
}

# Determine if the current shell is login one.
is_login_shell() {
  if is_bash; then
    shopt -q login_shell
    return
  elif is_zsh; then
    [[ -o login ]]
    return
  fi

  # ※ NOT perfect
  case "$(ps -p $$ -o args= 2> /dev/null)" in
    *-*) return 0 ;;
    *) return 1 ;;
  esac
}

# Display the login shell.
login_shell() {
  printf '%s\n' "$SHELL"
}

# Display the current shell process name.
_current_shell_process_name() {
  # Display a process's `comm` associated with the PID of the current shell(`$$`).
  ps -p $$ -o comm=
}

# Display the current shell path.
current_shell() {
  command -v "$(_current_shell_process_name)"
}

# Add a shell to the list of valid login shells.
add_shell() {
  local shell="$1"
  local shells='/etc/shells'

  if [[ ! -x "$shell" ]]; then
    print_error "'$shell' isn't a valid shell."
    return 2
  fi

  if grep -q "$shell" "$shells"; then
    print_info "The shell '$shell' is already in the list of valid login shells."
    return
  fi

  print_bold_yellow "Enter the password to add '$shell' to '$shells'"
  print_default "$shell" | sudo tee -a "$shells" > /dev/null

  if [[ $? == 0 ]]; then
    print_ok "Added '$shell' to '$shells'."
  else
    print_bold_red "Canceled the operation."
  fi
}

# Change the login shell to the specified one.
change_shell() {
  local shell="$1"

  if [[ "$(login_shell)" == "$shell" ]]; then
    print_default "The login shell is already '$shell'."
    return
  fi

  if ! grep -q "$shell" '/etc/shells'; then
    add_shell "$shell"
  fi

  chsh -s "$shell" || return

  export SHELL="$shell"

  print_ok "The login shell is now '$shell'."
}
