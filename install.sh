#!/usr/bin/env bash

#------------------------------------------------
# Create symbolic links
#------------------------------------------------
tmp_dir="$HOME/dotfiles/.tmp" # Overwritten files will be moved here
#------------------------------------------------

linked_filenames=(.{bash_profile,bashrc,zshrc,gitconfig,inputrc,tmux.conf,vimrc})

for filename in ${linked_filenames[@]}; do
  src="$HOME/dotfiles/$filename"
  target="$HOME/$filename"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$target"
done

# https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path
config_dirnames=({karabiner,git})

for dirname in ${config_dirnames[@]}; do
  config_path="$HOME/.config"
  src="$HOME/dotfiles/.config/$dirname"
  target="$config_path/$dirname"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$config_path"
done

#------------------------------------------------
# Install packages etc
#------------------------------------------------

[[ "$(uname)" == "Darwin" ]] && ~/dotfiles/macos/install.sh
type code > /dev/null 2>&1 && ~/dotfiles/vscode/install.sh
