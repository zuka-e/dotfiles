#!/usr/bin/env bash

set -euo pipefail

print_bold_yellow 'Setting up for macOS...'

"$DOTFILES_PATH/os/macos/scripts/setup-system.sh"

"$DOTFILES_PATH/os/macos/scripts/install-apps.sh"

"$DOTFILES_PATH/os/linux/scripts/add-sshd-configs.sh"

print_ok 'Setting up for macOS is complete.'
