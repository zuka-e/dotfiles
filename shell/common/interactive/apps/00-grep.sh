# Output the line number

#-----------------------------------------
if command -v ripgrep > /dev/null 2>&1; then
  alias rip-grep="\\ripgrep"
fi

if command -v rg > /dev/null 2>&1; then
  alias rip-grep="\\rg"
fi
#-----------------------------------------

if command -v rip-grep > /dev/null 2>&1; then
  alias rg='rip-grep --no-ignore --hidden --smart-case --with-filename'
  alias frg='rg --fixed-strings'
fi
