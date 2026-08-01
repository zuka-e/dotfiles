__dotfiles_load_scripts() {
  local _script_dir="$ZSH_CONFIG_HOME/interactive"

  #------------------------------------------------
  # Applications
  #------------------------------------------------

  # shellcheck source=./apps/index.zsh
  . "$_script_dir/apps/index.zsh"

  #------------------------------------------------
  # Shell
  #------------------------------------------------

  # shellcheck source=./history.zsh
  . "$_script_dir/history.zsh"
  # shellcheck source=./keybindings.zsh
  . "$_script_dir/keybindings.zsh"
  # shellcheck source=./options.zsh
  . "$_script_dir/options.zsh"
  # shellcheck source=./prompt.zsh
  . "$_script_dir/prompt.zsh"
  # shellcheck source=./debug.zsh
  . "$_script_dir/debug.zsh"
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
