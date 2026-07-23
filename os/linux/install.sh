#!/usr/bin/env bash

set -euo pipefail

~/dotfiles/os/linux/scripts/install-apps.sh

~/dotfiles/os/linux/scripts/add-sshd-configs.sh

~/dotfiles/os/linux/scripts/setup-zsh.sh
