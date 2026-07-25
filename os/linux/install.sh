#!/usr/bin/env bash

set -euo pipefail

"$DOTFILES_PATH/os/linux/scripts/install-apps.sh"

"$DOTFILES_PATH/os/linux/scripts/add-sshd-configs.sh"
