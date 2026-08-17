#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"

print_bold_yellow 'Setting up for Linux...'

"$DOTFILES_PATH/os/linux/scripts/install-apps.sh"

"$DOTFILES_PATH/os/linux/scripts/add-sshd-configs.sh"

print_ok 'Setting up for Linux is complete.'
