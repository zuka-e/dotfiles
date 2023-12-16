#!/usr/bin/env bash

# Note: `root` required

source ~/dotfiles/shell/functions.sh

# cf. https://support.apple.com/guide/certifications/apc35eb3dc4fa/web
SSHD_CONFIG_DIR=/private/etc/ssh/sshd_config.d

if [[ ! -e "$SSHD_CONFIG_DIR" ]]; then
  echo -e "\033[31mThe directory for SSH config doesn't exist.\033[0m"
  exit 2
fi

sshd_configs=$(find ~/dotfiles/shell/common/config/sshd_config.d -mindepth 1 -maxdepth 1)

for config in ${sshd_configs[@]}; do
  create_symbolic_link "$config" "$SSHD_CONFIG_DIR"
done

unset sshd_configs
