# shellcheck source=./log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"

# Remove comments that start with `#`.
remove_comments() {
  sed -E 's/[[:space:]]*#.*$//'
}

# Remove blank lines.
remove_blank_lines() {
  sed '/^[[:space:]]*$/d'
}

# Normalize a list of items to make it easier to compare two lists.
normalize_list() {
  remove_comments \
    | remove_blank_lines \
    | tr '[:upper:]' '[:lower:]' \
    | sort \
    | uniq
}
