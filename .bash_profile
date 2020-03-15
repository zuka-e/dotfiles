#[ Source other dotfiles ]
execute_files=(~/.{path,functions,aliases,env-vars,git-prompt.sh,git-completion.bash})
for file in ${execute_files[@]}; do
  [ -r "$file" ] && source "$file"; # True if file exists and is readable.
  if [ $? = 0 ]; then
    echo "'$file'" 'has executed!';
  else
    echo "'$file'" 'has NOT executed.';
  fi;
done

#[ Login_action ]
echo -e "\033[1;36mHello!! [$(whoami)]
$(date '+Login Time : %Y/%m/%d (%a) | %H:%M (%S)')\033[0m"

#[ Key_Bind cf.'~/.inputrc']
stty stop undef # Use Ctrl+s for forward-search-history
stty lnext undef # Use Ctrl+v for insert-last-argument

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
[ $(which pyenv) ] && eval "$(pyenv init -)"

#[ Command_Extension ]
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#[ Bash_Prompt ]
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
PS1='\[\033[1;33m\]\H:\[\033[1;32m\]\w/\[\033[31m\]$(__git_ps1)\[\033[0m\]:\$ '

