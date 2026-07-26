# Config: `$HOME/.config/fd/ignore`

#-----------------------------------------
if command -v fdfind > /dev/null 2>&1; then
  alias fd-find="\\fdfind"
fi

if command -v fd > /dev/null 2>&1; then
  alias fd-find="\\fd"
fi
#-----------------------------------------

if command -v fd-find > /dev/null 2>&1; then
  alias fd='fd-find --hidden'

  alias pathls="fd --max-depth 1 '.'" # Equivalent to 'ls -1A' but it outputs path.
fi
