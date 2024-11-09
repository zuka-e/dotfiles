#!/usr/bin/env bash

# Get user-defined temporary directory path
function tmp_dir() {
  echo "$HOME/dotfiles/.tmp"
}

# Determine if it's Mac.
function is_mac() {
  [[ "$(uname)" == "Darwin" ]]
}

# Determine if it's Linux.
function is_linux() {
  [[ "$(uname)" == "Linux" ]]
}

# Determine if it's from Fedora.
function is_fedora() {
  command -v dnf &> /dev/null
}

# Determine if it's from Debian.
function is_debian() {
  command -v apt &> /dev/null
}

# Determine if using Apple silicon processor.
function has_apple_silicon() {
  is_mac && [[ "$(uname -m)" == "arm64" ]]
}

# Determine if the current shell is interactive.
function is_interactive_shell() {
  [[ $- == *i* ]]
}

# Determine if the current shell is login one.
function is_login_shell() {
  [[ "$SHLVL" == 1 ]]
}

# Usage: create_symbolic_link $src $target
# - `$src`: a file or a directory disired to be referenced
# - `$target`: a directory in which a link will be created
# ※ The symbolic link name is based on `$src`
# ※ The original within `$target` will be moved to `~/dotfiles/.tmp`
function create_symbolic_link() {
  local src=$1
  local target=$2

  if [[ ! -e "$src" ]]; then
    echo -e "\033[33m\"$src\" does't exist.\033[0m"
    return
  fi

  # Prohibit arbitrary naming
  # ※ If the target directory is missing, a link will accidentally be created directly
  #   (e.g. ~/.config -> ~/.config/bat)
  if [[ ! -d "$target" ]]; then
    echo -e "\033[33m\"$target\" need to be a directory to create a symbolic link.\033[0m"
    return
  fi

  local basename=$(basename "$src")
  local dest="$target/$basename"
  local current_src=$(readlink "$dest")

  # No action if already created
  if [[ "$current_src" == "$src" ]]; then
    echo "\"$dest\" has already been linked."
    return
  fi

  # Move the current file to a tmp path before overwritten
  if [[ -e "$dest" ]]; then
    mv -v "$dest" "$(tmp_dir)/$basename $(date '+%s')"
  fi

  if [[ $? != 0 ]]; then
    return
  fi

  if [[ -L "$dest" ]]; then
    # cf. https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path
    ln -sfv "$src" "$target" \
      && echo "Previous reference was \"$dest\"."
  else
    ln -sv "$src" "$target"
  fi
}
