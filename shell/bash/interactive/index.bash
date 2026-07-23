_own_dir="$BASH_CONFIG_HOME/interactive"

#------------------------------------------------
# Applications
#------------------------------------------------

# shellcheck source=./apps/index.bash
. "$_own_dir/apps/index.bash"

#------------------------------------------------
# Shell
#------------------------------------------------

# shellcheck source=./completion.bash
. "$_own_dir/completion.bash"
# shellcheck source=./history.bash
. "$_own_dir/history.bash"
# shellcheck source=./keybindings.bash
. "$_own_dir/keybindings.bash"
# shellcheck source=./options.bash
. "$_own_dir/options.bash"
# shellcheck source=./prompt.bash
. "$_own_dir/prompt.bash"
