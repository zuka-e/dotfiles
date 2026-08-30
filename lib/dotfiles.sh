# Verify if the dotfiles are the expected.
verify_dotfiles() {
  local target="$DOTFILES_PATH/install.sh"
  local pattern='Repository: https://github.com/zuka-e/dotfiles.git'

  if [[ "$(grep "$pattern" "$target")" == '' ]]; then
    printf "'%s' isn't the valid dotfiles.\n" "$DOTFILES_PATH"
    return 1
  fi
}

# Verify dotfiles and set the associated env.
ensure_dotfiles() {
  verify_dotfiles || return

  local target="$DOTFILES_PATH/shell/common/environment/90-local.sh"

  if [[ -f "$target" ]] && [[ "$(grep "$DOTFILES_PATH" "$target")" == '' ]]; then
    printf "export DOTFILES_PATH='%s'\n" "$DOTFILES_PATH" >> "$target"
  fi

  : "${SHELL_CONFIG_HOME=$DOTFILES_PATH/shell}"
}
