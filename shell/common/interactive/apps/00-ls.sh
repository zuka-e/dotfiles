#!/usr/bin/env bash

source "$DOTFILES_PATH/shell/functions.sh"

# Define `LS_COLORS`
if is_linux; then
  eval "$(dircolors $DOTFILES_PATH/shell/common/config/.colorrc)"
elif is_mac; then
  LSCOLORS='GxfxcxdxBxegedabagacad'
fi

if type eza > /dev/null 2>&1; then
  alias ls='eza --all --header --icons --links --group --time-style=long-iso --git'
  alias ll='ls --long'
  alias lli='ll --inode --blocks' # Show index number, allocated size
  alias llat='ll --time=accessed --sort=accessed'
  alias llmt='ll --time=modified --sort=modified'
  alias llct='ll --time=changed --sort=changed'

  return
fi

if is_linux; then
  alias ls='ls --sort=version --almost-all --color=auto'
  alias ll='ls -all --human-readable --time-style="+%Y-%m-%d %H:%M:%S"'
  alias lli='ll --inode --size'
  alias llat='llt --sort=time --time=atime'
  alias llmt='llt --sort=time'
  alias llct='llt --sort=time --time=ctime'
elif is_mac; then
  alias ls="ls -AG"
  alias ll='ls -lhT -D "+%Y-%m-%d %H:%M:%S"'
  alias lli="ll -is"
  alias llat="ll -tu"
  alias llmt="ll -t"
  alias llct="ll -tc"
fi

unset time_style
