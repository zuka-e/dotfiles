# shellcheck source=./shell/bash/profile.bash
. "${DOTFILES_PATH=$HOME/dotfiles}/shell/bash/profile.bash"

# shellcheck source=.bashrc
[[ -r ~/.bashrc ]] && . ~/.bashrc
