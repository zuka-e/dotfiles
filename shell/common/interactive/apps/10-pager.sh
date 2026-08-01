# Pager (e.g. `git log`)
PAGER=less
# LESS='-FRX'

if command -v bat > /dev/null 2>&1; then
  # ※ `col -bx`: Prevent special text display (e.g.`^H`)
  # cf. https://github.com/sharkdp/bat/issues/2668
  MANPAGER='col -bx | bat --plain --language=man'
fi

export PAGER MANPAGER
