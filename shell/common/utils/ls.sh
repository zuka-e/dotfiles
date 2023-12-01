#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

if type eza > /dev/null 2>&1; then
  alias ls="eza --all --header --icons --links --group --time-style=long-iso --git"
  alias ll="ls --long"
  alias lli="ll --inode --blocks" # Show index number, allocated size
  alias llat="ll --time=accessed --sort=accessed"
  alias llmt="ll --time=modified --sort=modified"
  alias llct="ll --time=changed --sort=changed"

  return
fi

if is_linux; then
  time_style='--time-style="+%Y-%m-%d %H:%M:%S"'

  alias ls="ls --sort=version --almost-all --color=auto"
  alias ll="ls -all --human-readable $time_style"
  alias lli="ll --inode --size"
  alias llat="llt --sort=time --time=atime"
  alias llmt="llt --sort=time"
  alias llct="llt --sort=time --time=ctime"
elif is_mac; then
  time_style='-D "+%Y-%m-%d %H:%M:%S"'

  alias ls="ls -AG"
  alias ll="ls -lhT $time_style"
  alias lli="ll -is"
  alias llat="ll -tu"
  alias llmt="ll -t"
  alias llct="ll -tc"
fi

unset time_style
