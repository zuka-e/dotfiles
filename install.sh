#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

DOTFILES_PATH="$HOME/dotfiles"

#------------------------------------------------
# Preparation before installation
#------------------------------------------------

# shellcheck source=./shell/common/environment/index.sh
. "$DOTFILES_PATH/shell/common/environment/index.sh"

#------------------------------------------------
# Create symbolic links
#------------------------------------------------

basic_config_filenames=(.{bash_profile,bashrc,zprofile,zshrc,inputrc,vimrc})

for filename in ${basic_config_filenames[@]}; do
  create_symbolic_link "$HOME/dotfiles/$filename" "$HOME"
done

unset basic_config_filenames

if [[ ! -e "$XDG_CONFIG_HOME" ]]; then
  mkdir "$XDG_CONFIG_HOME"
fi

extended_configs=$(find ~/dotfiles/.config -mindepth 1 -maxdepth 1)

for config in ${extended_configs[@]}; do
  create_symbolic_link "$config" "$XDG_CONFIG_HOME"
done

unset extended_configs

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
