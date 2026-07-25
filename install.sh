#!/usr/bin/env bash

# Repository: https://github.com/zuka-e/dotfiles.git (Don't remove)

#------------------------------------------------
# Dotfiles script path resolution
#------------------------------------------------

if [[ -z "${DOTFILES_PATH-}" ]]; then
  DOTFILES_PATH="$(cd -- "$(dirname -- "$0")" && pwd)"
fi

# shellcheck source=./lib/dotfiles.sh
. "$DOTFILES_PATH/lib/dotfiles.sh"

ensure_dotfiles

#------------------------------------------------
# Preparation before installation
#------------------------------------------------

# shellcheck source=./shell/common/environment/index.sh
. "$DOTFILES_PATH/shell/common/environment/index.sh"

#------------------------------------------------
# Create symbolic links
#------------------------------------------------

# shellcheck source=./shell/common/lib/filesystem.sh
. "$DOTFILES_PATH/shell/common/lib/filesystem.sh"

config_filenames=(.{bash_profile,bashrc,zprofile,zshrc,inputrc,vimrc})

for filename in "${config_filenames[@]}"; do
  create_symbolic_link "$DOTFILES_PATH/$filename" "$HOME"
done

if [[ ! -e "$XDG_CONFIG_HOME" ]]; then
  mkdir "$XDG_CONFIG_HOME"
fi

xdg_config_dirs="$(find "$DOTFILES_PATH/.config" -mindepth 1 -maxdepth 1)"

for xdg_config_dir in "${xdg_config_dirs[@]}"; do
  create_symbolic_link "$xdg_config_dir" "$XDG_CONFIG_HOME"
done

#------------------------------------------------
# Install apps
#------------------------------------------------

"$DOTFILES_PATH/scripts/install-apps.sh"

#------------------------------------------------
# Setup apps
#------------------------------------------------

"$DOTFILES_PATH/scripts/setup-apps.sh"

# ------------------------------------------------
# Reload shell to apply changes
# ------------------------------------------------

exec "${SHELL}" -l
