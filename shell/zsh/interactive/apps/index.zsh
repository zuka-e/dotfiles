__dotfiles_load_scripts() {
  local _script_dir="$ZSH_CONFIG_HOME/interactive/apps"

  # shellcheck source=./nvm.zsh
  . "$_script_dir/nvm.zsh"
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
