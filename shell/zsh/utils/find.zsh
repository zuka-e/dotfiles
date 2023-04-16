# Config: `$HOME/.config/fd/ignore`

#-----------------------------------------
if type fdfind > /dev/null 2>&1; then
  alias fd-find="\\fdfind"
fi

if type fd > /dev/null 2>&1; then
  alias fd-find="\\fd"
fi
#-----------------------------------------

if type fd-find > /dev/null 2>&1; then
  alias fd="fd-find --hidden"

  alias pathls="fd --max-depth 1 '.'" # Equivalent to 'ls -1A' but it outputs path.
fi
