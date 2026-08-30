# shellcheck source=./log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"

# Get user-defined temporary directory path.
tmp_dir() {
  printf '%s/.tmp\n' "${DOTFILES_PATH:-$HOME/dotfiles}"
}

# Usage: create_symbolic_link $src $target
# - `$src`: a file or a directory desired to be referenced
# - `$target`: a directory in which a link will be created
# ※ The symbolic link name is based on `$src`
create_symbolic_link() {
  local src="$1"
  local target="$2"

  if [[ ! -e "$src" ]]; then
    print_error "'$src' does't exist."
    return
  fi

  # Prohibit arbitrary naming
  # ※ If the target directory is missing, a link will accidentally be created directly
  #   (e.g. ~/.config -> ~/.config/bat)
  if [[ ! -d "$target" ]]; then
    print_error "'$target' need to be a directory to create a symbolic link."
    return
  fi

  local filename="${src##*/}"

  [[ "$filename" == '.DS_Store' ]] && return

  local dest="$target/$filename"
  local current_src
  current_src="$(readlink "$dest")" || true

  # No action if already created
  if [[ "$current_src" == "$src" ]]; then
    print_default "'$dest' has already been linked."
    return
  fi

  # Move the current file (including a broken link) before overwritten.
  if [[ -e "$dest" || -L "$dest" ]]; then
    print_info "'$dest' already exists."
    print_bold "Backing up it to a tmp directory..."

    local timestamp
    timestamp="$(date +%s%N)"

    mkdir -p "$(tmp_dir)/$timestamp" \
      && sudo mv -v "$dest" "$(tmp_dir)/$timestamp/" || return
  fi

  print_bold "Creating symbolic link for '$src' to '$dest'."

  # cf. https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path
  sudo ln -sv "$src" "$dest"
}

# Get the absolute directory of the given path.
abs_dir() {
  local pathname="$1"

  if [[ ! -e "$pathname" ]]; then
    print_error "Couldn't access '$pathname'."
    return 2
  fi

  local dir

  if [[ -d "$pathname" ]]; then
    dir="$pathname"
  else
    dir="$(dirname -- "$pathname")"
  fi

  local abs_dir

  abs_dir="$(builtin cd -- "$dir" && pwd)" || printf ''

  if [[ "$abs_dir" == '' ]]; then
    print_error "Couldn't resolve a path."
    return 1
  fi

  printf '%s\n' "$abs_dir"
}

# Get the absolute path of the given path.
abs_path() {
  local pathname="$1"

  printf "%s/%s\n" \
    "$(abs_dir "$(dirname -- "$pathname")")" \
    "${pathname##*/}"
}
