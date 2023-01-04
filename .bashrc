#!/usr/bin/env bash

#[ Bash_Prompt ]
# ref. man bash (-> PROMPTING)
PS1='\033[1;35m\D{%Y/%m/%d(%a) %H:%M:%S}\033[0m\n\[\033[1;36m\]\u\[\033[0;37m\]@\[\033[1;33m\]\H:\[\033[1;32m\]\w/\[\033[31m\]$(__git_ps1)\[\033[0m\]:\n\$ '

#[ Source other dotfiles ]
execute_files=(~/dotfiles/shell/utils/.{aliases,git-prompt.sh,git-completion.bash})
for file in ${execute_files[@]}; do
  [[ -r "$file" ]] && source "$file";
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
PROMPT_COMMAND='sync_history;'
shopt -s histappend # Not write HISTFILE when session is closed

#[ Command_Extension ]
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#[ Terraform Completion ]
complete -C /usr/local/bin/terraform terraform

#[ npm Completion ] Result of: npm completion >> ~/.bashrc
if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
          COMP_LINE="$COMP_LINE" \
          COMP_POINT="$COMP_POINT" \
          npm completion -- "${words[@]}" \
          2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                COMP_LINE=$BUFFER \
                COMP_POINT=0 \
                npm completion -- "${words[@]}" \
                2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
          COMP_LINE="$line" \
          COMP_POINT="$point" \
          npm completion -- "${words[@]}" \
          2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
