SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

BASH_CONFIG_HOME="${BASH_CONFIG_HOME:-$SHELL_CONFIG_HOME/bash}"

# shellcheck source=./shell/bash/rc.bash
. "$BASH_CONFIG_HOME/rc.bash"
