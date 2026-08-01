: "${SHELL_CONFIG_HOME=$DOTFILES_PATH/shell}"

: "${BASH_CONFIG_HOME=$SHELL_CONFIG_HOME/bash}"

#------------------------------------------------
# Shell common config
#------------------------------------------------

# shellcheck source=../common/rc.sh
. "$BASH_CONFIG_HOME/../common/rc.sh"

#------------------------------------------------
# Bash specific config
#------------------------------------------------

# shellcheck source=./interactive/index.bash
. "$BASH_CONFIG_HOME/interactive/index.bash"
