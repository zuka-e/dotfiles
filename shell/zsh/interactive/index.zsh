_own_dir="$ZSH_CONFIG_HOME/interactive"

#------------------------------------------------
# Applications
#------------------------------------------------

# shellcheck source=./apps/index.zsh
. "$_own_dir/apps/index.zsh"

#------------------------------------------------
# Shell
#------------------------------------------------

# shellcheck source=./history.zsh
. "$_own_dir/history.zsh"
# shellcheck source=./keybindings.zsh
. "$_own_dir/keybindings.zsh"
# shellcheck source=./options.zsh
. "$_own_dir/options.zsh"
# shellcheck source=./prompt.zsh
. "$_own_dir/prompt.zsh"
# shellcheck source=./debug.zsh
. "$_own_dir/debug.zsh"
