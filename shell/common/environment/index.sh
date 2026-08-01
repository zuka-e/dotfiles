__dotfiles_load_scripts() {
  local _script_dir="$SHELL_CONFIG_HOME/common/environment"

  # shellcheck source=./00-base.sh
  . "$_script_dir/00-base.sh"
  # shellcheck source=./10-locale.sh
  . "$_script_dir/10-locale.sh"
  # shellcheck source=./20-runtime.sh
  . "$_script_dir/20-runtime.sh"
  # shellcheck source=./30-path.sh
  . "$_script_dir/30-path.sh"
  # shellcheck source=./50-apps.sh
  . "$_script_dir/50-apps.sh"

  if [[ -f "$_script_dir/90-local.sh" ]]; then
    # shellcheck source=/dev/null
    . "$_script_dir/90-local.sh"
  fi
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
