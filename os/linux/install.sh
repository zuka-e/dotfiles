#!/usr/bin/env bash

set -euo pipefail

print_bold_yellow 'Setting up for Linux...'

"$DOTFILES_PATH/os/linux/scripts/install-apps.sh"

"$DOTFILES_PATH/os/linux/scripts/add-sshd-configs.sh"

print_ok 'Setting up for Linux is complete.'
