#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

export LANG=C.UTF-8

is_fedora && ~/dotfiles/os/fedora/install.sh
is_debian && ~/dotfiles/os/debian/install.sh
