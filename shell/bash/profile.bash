SHELL_CONFIG_HOME="$DOTFILES_PATH/shell"

BASH_CONFIG_HOME="$SHELL_CONFIG_HOME/bash"

# shellcheck source=./environment/index.bash
. "$BASH_CONFIG_HOME/environment/index.bash"

if [[ $- == *i* ]]; then
  # shellcheck source=../common/lib/log.sh
  . "$BASH_CONFIG_HOME/../common/lib/log.sh"
  print_bold_red "$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')"
fi
