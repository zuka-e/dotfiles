DOTFILES_PATH="${DOTFILES_PATH:-$HOME/dotfiles}"

SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

ZSH_CONFIG_HOME="$SHELL_CONFIG_HOME/zsh"

# shellcheck source=./shell/zsh/environment/index.zsh
. "$ZSH_CONFIG_HOME/environment/index.zsh"

if [[ -t 0 ]]; then
  echo -e "\033[1;31m$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')\033[0m"
fi
