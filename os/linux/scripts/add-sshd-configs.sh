#!/usr/bin/env bash

source "$DOTFILES_PATH/shell/functions.sh"

sshd_configs=$(find "$DOTFILES_PATH/shell/common/config/sshd_config.d" -mindepth 1 -maxdepth 1)

for config in ${sshd_configs[@]}; do
  sudo bash -c "$(declare -f create_symbolic_link); create_symbolic_link $config /etc/ssh/sshd_config.d"
done

sudo systemctl reload sshd.service

unset sshd_configs
