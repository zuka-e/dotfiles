#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

is_linux && ~/dotfiles/os/linux/install.sh
is_mac && ~/dotfiles/os/macos/install.sh
