SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

ZSH_CONFIG_HOME="$SHELL_CONFIG_HOME/zsh"

# shellcheck source=./environment/index.zsh
. "$ZSH_CONFIG_HOME/environment/index.zsh"

if [[ -o interactive ]]; then
  # shellcheck source=../common/lib/log.sh
  . "$ZSH_CONFIG_HOME/../common/lib/log.sh"
  print_bold_red "$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')"
fi
