SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

ZSH_CONFIG_HOME="${ZSH_CONFIG_HOME:-$SHELL_CONFIG_HOME/zsh}"

# shellcheck source=./shell/zsh/rc.zsh
. "$ZSH_CONFIG_HOME/rc.zsh"

# shellcheck source=./shell/zsh/lib/oh-my-zsh/index.zsh
. "$ZSH_CONFIG_HOME/lib/oh-my-zsh/index.zsh"

. "$ZSH/oh-my-zsh.sh"
