#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

export LANG=C.UTF-8

is_fedora && ~/dotfiles/os/fedora/install.sh
is_debian && ~/dotfiles/os/debian/install.sh

if command -v sshd &> /dev/null; then
  ~/dotfiles/os/linux/setup-sshd.sh
fi

if command -v zsh &> /dev/null; then
  ~/dotfiles/os/linux/setup-zsh.sh
fi
