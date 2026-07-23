_own_dir="$BASH_CONFIG_HOME/interactive/apps"

# shellcheck source=./git-completion.bash
. "$_own_dir/git-completion.bash"
# shellcheck source=./git-prompt.bash
. "$_own_dir/git-prompt.bash"
# shellcheck source=./nvm.bash
. "$_own_dir/nvm.bash"
# shellcheck source=./npm.bash
. "$_own_dir/npm.bash"
# shellcheck source=./poetry.bash
. "$_own_dir/poetry.bash"
# shellcheck source=./terraform.bash
. "$_own_dir/terraform.bash"
