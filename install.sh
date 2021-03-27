#!/usr/bin/env bash

# Make symlinks
(cd ~/dotfiles/; # Inside '()', a Sub-shell works
linked_files=(.{bash_profile,bashrc,gitconfig,inputrc,tmux.conf,vimrc})
for file in ${linked_files[@]}; do
  # Opts: s:symlink f:forced v:verbose
  # If you confirm before it has executed, replace '-f' with '-i'
  ln -sfv ~/dotfiles/"${file}" ~/"${file}";
done;)
source ~/.bash_profile
