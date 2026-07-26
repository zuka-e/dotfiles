#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../../../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../../../shell/common/lib/filesystem.sh
. "$DOTFILES_PATH/shell/common/lib/filesystem.sh"

# cf. https://support.apple.com/guide/certifications/apc35eb3dc4fa/web
SSHD_CONFIG_DIR=/etc/ssh/sshd_config.d

configs="$(find "$DOTFILES_PATH/os/linux/config/sshd_config.d" -mindepth 1 -maxdepth 1)"

for config in "${configs[@]}"; do
  create_symbolic_link "$config" "$SSHD_CONFIG_DIR"
done

if command -v systemctl > /dev/null 2>&1; then
  sudo systemctl reload sshd.service
fi
