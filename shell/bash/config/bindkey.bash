# See `~/.inputrc`

# Unset default keybindings
if [[ -t 0 ]]; then # Prevent an error 'stty: stdin is not a terminal'
  stty stop undef   # Use Ctrl+S for forward-search-history
  stty lnext undef  # Use Ctrl+V for insert-last-argument
fi
