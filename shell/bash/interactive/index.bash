__dotfiles_load_scripts() {
  local _script_dir="$BASH_CONFIG_HOME/interactive"

  #------------------------------------------------
  # Applications
  #------------------------------------------------

  # shellcheck source=./apps/index.bash
  . "$_script_dir/apps/index.bash"

  #------------------------------------------------
  # Shell
  #------------------------------------------------

  # shellcheck source=./completion.bash
  . "$_script_dir/completion.bash"
  # shellcheck source=./history.bash
  . "$_script_dir/history.bash"
  # shellcheck source=./keybindings.bash
  . "$_script_dir/keybindings.bash"
  # shellcheck source=./options.bash
  . "$_script_dir/options.bash"
  # shellcheck source=./prompt.bash
  . "$_script_dir/prompt.bash"
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
