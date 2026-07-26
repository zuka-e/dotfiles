# Output the line number

#-----------------------------------------
if type ripgrep > /dev/null 2>&1; then
  alias rip-grep="\\ripgrep"
fi

if type rg > /dev/null 2>&1; then
  alias rip-grep="\\rg"
fi
#-----------------------------------------

if type rip-grep > /dev/null 2>&1; then
  alias rg='rip-grep --no-ignore --hidden --smart-case --with-filename'
  alias frg='rg --fixed-strings'
fi
