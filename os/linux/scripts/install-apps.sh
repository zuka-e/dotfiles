#!/usr/bin/env bash

source "$DOTFILES_PATH/shell/functions.sh"

export LANG=C.UTF-8

is_fedora && "$DOTFILES_PATH/os/fedora/install.sh"
is_debian && "$DOTFILES_PATH/os/debian/install.sh"
