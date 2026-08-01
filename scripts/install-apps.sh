#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../shell/common/lib/system.sh
. "$DOTFILES_PATH/shell/common/lib/system.sh"

print_bold_yellow 'Installing apps...'

if is_linux; then
  print_bold 'Linux OS is detected.'
  "$DOTFILES_PATH/os/linux/install.sh"
elif is_mac; then
  print_bold 'macOS is detected.'
  "$DOTFILES_PATH/os/macos/install.sh"
fi

print_ok 'Installing apps is complete.'
