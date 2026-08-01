: "${SHELL_CONFIG_HOME=$DOTFILES_PATH/shell}"

: "${ZSH_CONFIG_HOME=$SHELL_CONFIG_HOME/zsh}"

#------------------------------------------------
# Shell common config
#------------------------------------------------

# shellcheck source=../common/rc.sh
. "$ZSH_CONFIG_HOME/../common/rc.sh"

#------------------------------------------------
# Zsh specific config
#------------------------------------------------

# shellcheck source=./interactive/index.zsh
. "$ZSH_CONFIG_HOME/interactive/index.zsh"

#------------------------------------------------
# Zsh config manager
#------------------------------------------------

# shellcheck source=./lib/oh-my-zsh/index.zsh
. "$ZSH_CONFIG_HOME/lib/oh-my-zsh/index.zsh"
