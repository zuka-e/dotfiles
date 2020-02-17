#!/bin/bash

# Make symlinks except_for(.git .DS_Store)
(cd ~/dotfiles/; # Inside '()', a Sub-shell works
for file in .??*; do
  [ ${file} = ".git" ] && continue
  [ ${file} = ".DS_Store" ] && continue
  # Opts(ln): s:symlink f:forced v:verbose
  # If you confirm before it has executed, replace '-f' with '-i'
  ln -sfv ~/dotfiles/"${file}" ~/"${file}";
done;)
source ~/.bash_profile

