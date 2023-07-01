#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

#------------------------------------------------
# Create symbolic links
#------------------------------------------------
tmp_dir="$HOME/dotfiles/.tmp" # Overwritten files will be moved here
#------------------------------------------------

linked_filenames=(.{bash_profile,bashrc,zprofile,zshrc,gitconfig,inputrc,tmux.conf,vimrc})

for filename in ${linked_filenames[@]}; do
  src="$HOME/dotfiles/$filename"
  target="$HOME/$filename"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$target"
done

# Configs
# cf. https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path
export CONFIG_PATH="$HOME/.config"

if [[ ! -e $CONFIG_PATH ]]; then
  # With no $CONFIG_PATH, it'll accidentally be linked directly (e.g. ~/.config -> ~/.config/bat)
  mkdir $CONFIG_PATH
fi

configs="$HOME/dotfiles/.config/*"

for config in ${configs[@]}; do
  [[ ! -e $config ]] && break

  target="$CONFIG_PATH/$(basename $config)"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  echo $config $target
  ln -sfv "$config" "$CONFIG_PATH"
done

#------------------------------------------------
# Install packages etc
#------------------------------------------------

is_mac && "$HOME/dotfiles/macos/install.sh"
type code > /dev/null 2>&1 && "$HOME/dotfiles/vscode/install.sh"

exec "${SHELL}" -l
