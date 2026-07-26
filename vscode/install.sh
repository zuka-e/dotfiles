#!/usr/bin/env bash

# shellcheck source=../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../shell/common/lib/filesystem.sh
. "$DOTFILES_PATH/shell/common/lib/filesystem.sh"

#------------------------------------------------
# Create symbolic links for settings
#------------------------------------------------
configs="$(find "$DOTFILES_PATH/vscode/config" -depth 1 ! -name "*.*sh")"

for editor in "Code" "Cursor"; do
  config_dir="$HOME/Library/Application Support/$editor/User"

  if [[ -d "$config_dir" ]]; then
    print_bold_yellow "Creating symbolic links for '$editor'..."
    for config in "${configs[@]}"; do
      create_symbolic_link "$config" "$config_dir"
    done
    print_ok "Creating symbolic links for '$editor' is complete."
  fi
done

unset configs
