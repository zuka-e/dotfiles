#!/usr/bin/env bash

source ~/dotfiles/shell/common/config/paths.sh
source ~/dotfiles/shell/functions.sh

#------------------------------------------------
# Create symbolic links
#------------------------------------------------

basic_config_filenames=(.{bash_profile,bashrc,zprofile,zshrc,gitconfig,inputrc,tmux.conf,vimrc})

for filename in ${basic_config_filenames[@]}; do
  create_symbolic_link "$DOTFILES_PATH/$filename" "$HOME"
done

unset basic_config_filenames

if [[ ! -e "$CONFIG_PATH" ]]; then
  mkdir "$CONFIG_PATH"
fi

extended_configs=$(find "$DOTFILES_PATH/.config" -mindepth 1 -maxdepth 1)

for config in ${extended_configs[@]}; do
  create_symbolic_link "$config" "$CONFIG_PATH"
done

unset extended_configs

#------------------------------------------------
# Install packages etc
#------------------------------------------------

is_mac && "$DOTFILES_PATH/macos/install.sh"
type code > /dev/null 2>&1 && "$DOTFILES_PATH/vscode/install.sh"

exec "${SHELL}" -l
