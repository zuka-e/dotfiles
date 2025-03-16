#!/usr/bin/env bash

source ~/dotfiles/shell/common/config/paths.sh
source ~/dotfiles/shell/functions.sh

#------------------------------------------------
# Create symbolic links for settings
#------------------------------------------------
configs=$(find ~/dotfiles/vscode/config -depth 1 ! -name "*.*sh")

for editor in "Code" "Cursor"; do
  config_dir="$HOME/Library/Application Support/$editor/User"

  if [[ -d "$config_dir" ]]; then
    echo "Linking configs to $editor..."
    for config in ${configs[@]}; do
      create_symbolic_link "$config" "$config_dir"
    done
  else
    echo "$editor config directory not found. Skipping $editor config setup."
  fi
done

unset configs
