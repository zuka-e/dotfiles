#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../../../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../../../shell/common/lib/system.sh
. "$DOTFILES_PATH/shell/common/lib/system.sh"

print_bold_yellow 'Installing apps for Linux...'

if has_dnf > /dev/null 2>&1; then
  print_bold "Package manager 'dnf' is detected."
  "$DOTFILES_PATH/os/fedora/install.sh"
elif has_apt > /dev/null 2>&1; then
  if [[ -n "$TERMUX_VERSION" ]]; then
    print_bold "Termux is detected."
    "$DOTFILES_PATH/os/termux/install.sh"
  else
    print_bold "Package manager 'apt' is detected."
    "$DOTFILES_PATH/os/debian/install.sh"
  fi
fi

if command -v zsh > /dev/null 2>&1; then
  shell="$(which -a zsh | head -1)"

  if [[ "$(login_shell)" != "$shell" ]]; then
    change_shell "$shell"
  fi
fi

print_ok 'Installing apps for Linux is complete.'
