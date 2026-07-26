#!/usr/bin/env bash

set -euo pipefail

type code > /dev/null 2>&1 \
  || type cursor > /dev/null 2>&1 \
  && "$DOTFILES_PATH/vscode/install.sh"
