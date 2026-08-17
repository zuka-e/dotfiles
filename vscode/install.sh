#!/usr/bin/env bash

# shellcheck source=../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../shell/common/lib/filesystem.sh
. "$DOTFILES_PATH/shell/common/lib/filesystem.sh"

#------------------------------------------------
# Create symbolic links for settings
#------------------------------------------------
configs="$(find "$DOTFILES_PATH/vscode/config" -depth 1 ! -name "*.*sh")"

# Editors compatible with VSCode
editors=()
if command -v code > /dev/null 2>&1; then
  editors+=("Code")
fi
if command -v agy-ide > /dev/null 2>&1; then
  editors+=("Antigravity IDE")
fi

if [[ -d "$HOME/Library/Application Support" ]]; then
  xdg_config_dir="$HOME/Library/Application Support"
elif [[ -d "$HOME/.config" ]]; then
  xdg_config_dir="$HOME/.config"
fi

for editor in "${editors[@]}"; do
  config_dir="$xdg_config_dir/$editor/User"

  if [[ -d "$config_dir" ]]; then
    print_bold_yellow "Creating symbolic links for '$editor'..."
    for config in $configs; do
      create_symbolic_link "$config" "$config_dir"
    done
    print_ok "Creating symbolic links for '$editor' is complete."
  fi
done

#------------------------------------------------
# Install extensions
#------------------------------------------------

"$DOTFILES_PATH/vscode/scripts/install-extensions.sh"
