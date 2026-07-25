#!/usr/bin/env bash

# shellcheck source=../shell/common/lib/system.sh
. "$DOTFILES_PATH/shell/common/lib/system.sh"

is_linux && "$DOTFILES_PATH/os/linux/install.sh"
is_mac && "$DOTFILES_PATH/os/macos/install.sh"
