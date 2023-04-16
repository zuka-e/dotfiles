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

# Configs
# cf. https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path
export CONFIG_PATH="$HOME/.config"

configs="$HOME/dotfiles/.config/*"

for config in ${configs[@]}; do
  [[ ! -e $config ]] && break

  target="$CONFIG_PATH/$(basename $config)"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$config" "$CONFIG_PATH"
done

# ZShell (Oh My Zsh )
# cf. https://github.com/ohmyzsh/ohmyzsh/blob/master/oh-my-zsh.sh
(
  ZSH="$HOME/.oh-my-zsh"
  src="$HOME/dotfiles/.oh-my-zsh/custom"
  target="$ZSH/custom"

  [[ -L "$target" ]] && exit

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$ZSH"
)

#------------------------------------------------
# Install packages etc
#------------------------------------------------

[[ "$(uname)" == "Darwin" ]] && ~/dotfiles/macos/install.sh
type code > /dev/null 2>&1 && ~/dotfiles/vscode/install.sh
