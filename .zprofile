DOTFILES_PATH="${DOTFILES_PATH:-$HOME/dotfiles}"

SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

ZSH_CONFIG_HOME="$SHELL_CONFIG_HOME/zsh"

# shellcheck source=./shell/zsh/environment/index.zsh
. "$ZSH_CONFIG_HOME/environment/index.zsh"

if [[ -o interactive ]]; then
  # shellcheck source=./shell/common/lib/log.sh
  . "$DOTFILES_PATH/shell/common/lib/log.sh"
  print_bold_red "$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')"
fi
