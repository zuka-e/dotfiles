#!/usr/bin/env bash

source ~/dotfiles/shell/common/config/paths.sh
source ~/dotfiles/shell/functions.sh

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
# Install completions
#------------------------------------------------
~/dotfiles/install-bash-completion.sh

#------------------------------------------------
# Install packages etc
#------------------------------------------------

is_mac && ~/dotfiles/macos/install.sh
type code > /dev/null 2>&1 && ~/dotfiles/vscode/install.sh

exec "${SHELL}" -l
