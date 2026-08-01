__dotfiles_load_scripts() {
  local _script_dir="$BASH_CONFIG_HOME/interactive/apps"

  # shellcheck source=./git-completion.bash
  . "$_script_dir/git-completion.bash"
  # shellcheck source=./git-prompt.bash
  . "$_script_dir/git-prompt.bash"
  # shellcheck source=./nvm.bash
  . "$_script_dir/nvm.bash"
  # shellcheck source=./npm.bash
  . "$_script_dir/npm.bash"
  # shellcheck source=./poetry.bash
  . "$_script_dir/poetry.bash"
  # shellcheck source=./terraform.bash
  . "$_script_dir/terraform.bash"
}

__dotfiles_load_scripts

unset -f __dotfiles_load_scripts > /dev/null 2>&1
