# shellcheck disable=SC2034

# For more information..., `man zshparam zshoptions zshbuiltins`etc

# cf. https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh

# The number of commands to remember in the command history.
HISTSIZE=10000
# The maximum number of history events to save in the history file.
SAVEHIST=10000

# Lists all history without event numbers.
alias history-view='fc -l -n 1'

# Lists all history with ISO datetime.
alias history-view-iso='fc -l -i 1'
