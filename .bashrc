#!/usr/bin/env bash

#[ Source other dotfiles ]
execute_files=(~/dotfiles/.{path,aliases,env-vars,git-prompt.sh,git-completion.bash})
for file in ${execute_files[@]}; do
  [[ -r "$file" ]] && source "$file"; # True if file exists and is readable.
done

#[ Key_Bind cf.'~/.inputrc']
if [[ -t 0 ]]; then # Prevent an error 'stty: stdin is not a terminal'
  stty stop undef # Use Ctrl+s for forward-search-history
  stty lnext undef # Use Ctrl+v for insert-last-argument
fi

#[ Shell_Setting ]
set -o noclobber # Restrict overwriting
set -o ignoreeof # Ignore 'logout', only IGNOREEOF-times
IGNOREEOF=1

#[ Shell_Option ]
shopt -s cdspell # 'cd':AutoCorrect simple mistakes
shopt -s interactive_comments # Not evaluate command after'#' (default)

#[ Sync_History ]
function sync_history {
  history -a # Add a history of the current bash session to HISTFILE
  history -c # Clear a history out of the current bash session
  history -r # Read from HISTFILE and set as the current history
}
# PROMPT_COMMAND: It'll be run, every time command run
PROMPT_COMMAND='sync_history'
shopt -u histappend # Not write HISTFILE when session is closed

#[ Virtual_Env ]
[[ "$(which nodenv)" ]] && eval "$(nodenv init -)"
[[ "$(which pyenv)" ]] && eval "$(pyenv init -)"
[[ "$(which rbenv)" ]] && eval "$(rbenv init -)"

#[ Command_Extension ]
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#[ Bash_Prompt ]
PS1='\[\033[1;33m\]\H:\[\033[1;32m\]\w/\[\033[31m\]$(__git_ps1)\[\033[0m\]:\$ '
# \d: Display date formatted-like "Sun Feb 14"
# \h: Hostname before'@'
# \H: Hostname
# \t: Time 24-hour-formatted "HH:MM:SS"
# \T: Time 12-hour-formatted "HH:MM:SS"
# \@: Time AM-PM-formatted "HH:MM"
# \u: Username
# \W: Name of Current-Directory
# \w: Location of Current-Directory
# \!: Number of history
# \#: Number of excuted commands in the current session
