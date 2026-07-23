DOTFILES_PATH="${DOTFILES_PATH:-$HOME/dotfiles}"

SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

BASH_CONFIG_HOME="$SHELL_CONFIG_HOME/bash"

# shellcheck source=./shell/bash/environment/index.bash
. "$BASH_CONFIG_HOME/environment/index.bash"

if [[ -t 0 ]]; then
  echo -e "\033[1;31m$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')\033[0m"
fi

# shellcheck source=.bashrc
[[ -r ~/.bashrc ]] && . ~/.bashrc
