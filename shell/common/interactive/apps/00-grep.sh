#-----------------------------------------
# ripgrep
#------------------------------------------------
# cf. https://github.com/burntsushi/ripgrep

if command -v ripgrep > /dev/null 2>&1; then
  alias rg="\\ripgrep"
fi

if command -v rg > /dev/null 2>&1; then
  alias rg='rg --no-ignore --hidden --smart-case --with-filename'
  alias frg='rg --fixed-strings'
fi
