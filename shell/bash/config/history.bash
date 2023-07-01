# See `man bash` for more options.

export HISTFILE="$HOME/.bash_history" # Use "~/.bash_history" even on tmux
export HISTSIZE=10000 # Number of history of current shell
export HISTFILESIZE=10000 # Number of history of HISTFILE, shell-var
export HISTTIMEFORMAT="%F %T " # Show timestamp running `history`. see `man strftime`
# export HISTCONTROL=ignoreboth # Not record the same command as the previous

function sync_history {
  history -a # Add a history of the current bash session to HISTFILE
  history -c # Clear a history out of the current bash session
  history -r # Read from HISTFILE and set as the current history
}

# It'll be run when a command is run.
if [[ -n "${PROMPT_COMMAND+x}" ]]; then
  PROMPT_COMMAND="$PROMPT_COMMAND;sync_history"
else
  PROMPT_COMMAND="sync_history"
fi

shopt -s histappend # Not write to `HISTFILE` when session is closed
