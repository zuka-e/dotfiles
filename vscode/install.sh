#!/usr/bin/env bash

# Make a symlink (f:forced v:verbose)
ln -sfv ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Install extensions
cat ~/dotfiles/vscode/extensions | while read line; do
  code --install-extension $line;
done
