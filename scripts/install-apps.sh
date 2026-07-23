#!/usr/bin/env bash

. "$DOTFILES_PATH/shell/functions.sh"

is_linux && "$DOTFILES_PATH/os/linux/install.sh"
is_mac && "$DOTFILES_PATH/os/macos/install.sh"
