#!/usr/bin/env bash

# shellcheck source=../../../shell/common/lib/system.sh
. "$DOTFILES_PATH/shell/common/lib/system.sh"

has_dnf && "$DOTFILES_PATH/os/fedora/install.sh"
has_apt && "$DOTFILES_PATH/os/debian/install.sh"

if command -v zsh > /dev/null 2>&1; then
  shell="$(which -a zsh | head -1)"

  if [[ "$(login_shell)" != "$shell" ]]; then
    change_shell "$shell"
  fi
fi
