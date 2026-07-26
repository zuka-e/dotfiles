__dotfiles_load_scripts() {
  local _script_dir="$SHELL_CONFIG_HOME/common/interactive/apps"

  # shellcheck source=./00-editor.sh
  . "$_script_dir/00-editor.sh"
  # shellcheck source=./00-find.sh
  . "$_script_dir/00-find.sh"
  # shellcheck source=./00-grep.sh
  . "$_script_dir/00-grep.sh"
  # shellcheck source=./00-ls.sh
  . "$_script_dir/00-ls.sh"
  # shellcheck source=./00-viewer.sh
  . "$_script_dir/00-viewer.sh"
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
