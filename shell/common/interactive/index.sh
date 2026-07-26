__dotfiles_load_scripts() {
  local _script_dir="$SHELL_CONFIG_HOME/common/interactive"

  # shellcheck source=./apps/index.sh
  . "$_script_dir/apps/index.sh"

  # alias etc
  # shellcheck source=./misc.sh
  . "$_script_dir/misc.sh"
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
