# See `man bash` for more options.

# The number of commands to remember in the command history.
HISTSIZE=10000
# The maximum number of lines contained in the history file.
HISTFILESIZE=10000
# Show timestamp running `history`. see `man strftime`
HISTTIMEFORMAT='%F %T '

# Not write to `HISTFILE` when session is closed.
shopt -s histappend

# cf. https://linuxcommand.org/lc3_man_pages/historyh.html
sync_history() {
  history -a # Add a history of the current bash session to HISTFILE
  history -c # Clear a history out of the current bash session
  history -r # Read from HISTFILE and set as the current history
}

# Lists all history without event numbers.
alias history-view='fc -l -n 1'

# It'll be run when a command is run.
PROMPT_COMMAND+=(sync_history)
