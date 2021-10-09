#!/usr/bin/env bash

#------------------------------------------------
# Create symbolic links
#------------------------------------------------
# Opts -> s:symlink f:forced v:verbose, i: interactive

(cd ~/dotfiles/; # Inside '()', the Sub-shell works
linked_files=(.{bash_profile,bashrc,gitconfig,inputrc,tmux.conf,vimrc})
for file in ${linked_files[@]}; do
  ln -sfv ~/dotfiles/"${file}" ~/"${file}";
done;)

source ~/.bash_profile
