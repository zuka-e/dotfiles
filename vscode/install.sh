#!/usr/bin/env bash

#------------------------------------------------
# Create symbolic links for settings
#------------------------------------------------

tmp_dir="$HOME/dotfiles/.tmp"
setting_filenames=({keybindings.json,settings.json})

for filename in ${setting_filenames[@]}; do
  src="$HOME/dotfiles/vscode/$filename"
  target="$HOME/Library/Application Support/Code/User/$filename"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$target"
done

setting_dirnames=({snippets,})

for dirname in ${setting_dirnames[@]}; do
  setting_path="$HOME/Library/Application Support/Code/User"
  src="$HOME/dotfiles/vscode/$dirname"
  target="$setting_path/$dirname"

  [[ -L "$target" ]] && continue

  [[ -e "$target" ]] && mv -fv "$target" "$tmp_dir"

  ln -sfv "$src" "$setting_path"
done
