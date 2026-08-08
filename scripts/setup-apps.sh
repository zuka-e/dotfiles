#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"

print_bold_yellow 'Setting up apps...'

if command -v code > /dev/null 2>&1 \
  || command -v agy-ide > /dev/null 2>&1; then
  print_bold_yellow 'Setting up Visual Studio Code related apps...'
  "$DOTFILES_PATH/vscode/install.sh"
  print_ok 'Setting up Visual Studio Code related apps is complete.'
fi

print_ok 'Setting up apps is complete.'
