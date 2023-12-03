#!/usr/bin/env bash

source ~/dotfiles/shell/common/config/paths.sh
source ~/dotfiles/shell/functions.sh

#------------------------------------------------
# Create symbolic links for settings
#------------------------------------------------

export VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"

if [[ ! -d "$VSCODE_CONFIG_DIR" ]]; then
  echo "$VSCODE_CONFIG_DIR doesn't exist."
  echo "Make sure VSCode is installed."
  return
fi

configs=$(find $DOTFILES_PATH/vscode -depth 1 ! -name "*.*sh")

for config in ${configs[@]}; do
  create_symbolic_link "$config" "$VSCODE_CONFIG_DIR"
done

unset configs
