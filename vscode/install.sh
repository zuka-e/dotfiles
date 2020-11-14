#!/usr/bin/env bash

# Make a symlink (f:forced v:verbose)
ln -sfv ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Install extensions
path=~/dotfiles/vscode/extensions
\grep -v "^\s*$"  "${path}" | # Remove blank lines
  \grep  -v "^#" | # Remove comment lines starting '#'
    sed "s/ .*//" | # Remove comments from each line
      while read line;
        do code --install-extension "${line}";
      done;
unset path
