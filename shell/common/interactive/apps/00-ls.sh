#------------------------------------------------
# Color
#------------------------------------------------

# shellcheck disable=SC2034

if command -v dircolors > /dev/null 2>&1; then
  # `LS_COLORS`
  eval "$(dircolors "$SHELL_CONFIG_HOME/common/interactive/apps/.colorrc")"
else
  LSCOLORS='GxfxcxdxBxegedabagacad'
fi

#------------------------------------------------
# eza
#------------------------------------------------
# cf. https://github.com/eza-community/eza

if command -v eza > /dev/null 2>&1; then
  alias ls='eza --all --header --icons --links --group --time-style=long-iso --git'
  alias ll='ls --long'
  alias lli='ll --inode --blocks' # Show index number, allocated size
  alias llat='ll --time=accessed --sort=accessed'
  alias llmt='ll --time=modified --sort=modified'
  alias llct='ll --time=changed --sort=changed'

  return
fi

#------------------------------------------------
# ls
#------------------------------------------------

if command ls --color > /dev/null >&2; then
  alias ls='ls --sort=version --almost-all --color=auto'
  alias ll='ls -all --human-readable --time-style="+%Y-%m-%d %H:%M:%S"'
  alias lli='ll --inode --size'
  alias llat='llt --sort=time --time=atime'
  alias llmt='llt --sort=time'
  alias llct='llt --sort=time --time=ctime'
elif command ls -G > /dev/null >&2; then
  alias ls="ls -AG"
  alias ll='ls -lhT -D "+%Y-%m-%d %H:%M:%S"'
  alias lli="ll -is"
  alias llat="ll -tu"
  alias llmt="ll -t"
  alias llct="ll -tc"
fi
