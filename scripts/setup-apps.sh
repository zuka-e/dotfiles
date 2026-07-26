#!/usr/bin/env bash

set -euo pipefail

command -v code > /dev/null 2>&1 \
  || command -v cursor > /dev/null 2>&1 \
  && "$DOTFILES_PATH/vscode/install.sh"
