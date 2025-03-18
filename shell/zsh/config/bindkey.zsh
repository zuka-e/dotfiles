# For details of options, see `man zshzle`.
# - `bindkey`: lists bound keys

# `^`: ctrl
# `^[`: esc (meta)

# Default
bindkey "^[." insert-last-word

bindkey "^L" kill-word
bindkey "^U" backward-kill-line
