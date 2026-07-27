#------------------------------------------------
# fd
#------------------------------------------------
# cf. https://github.com/sharkdp/fd

if command -v fdfind > /dev/null 2>&1; then
  alias fd='fdfind'
fi

if command -v fd-find > /dev/null 2>&1; then
  alias fd='fd-find'
fi

if command -v fd > /dev/null 2>&1; then
  alias fd='fd --hidden --no-require-git --case-sensitive'
  alias fd-all='fd --unrestricted'
fi
