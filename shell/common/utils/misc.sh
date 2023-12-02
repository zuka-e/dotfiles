#!/usr/bin/env bash

function cdls() {
  \cd "$@" && ls
}
alias cd="cdls"

function mkdircd() {
  \mkdir -p "$@" && cd "$_"
}

alias mkdir="mkdir -p"

# Use extended regular expressions
alias esed="sed -E"

# i:Interactive, p:Preserve-attributes, r:Recursive, v:Verbose
alias cp="cp -iprv"
alias scp="echo Deprecated! Use \'rsync\' etc instead.; #"
alias mv="mv -iv"
alias rm="rm -irv"

#------------------------------------------------
# Rsync
#------------------------------------------------
# -a, --archive          archive mode; same as -rlptgoD (no -A,-X,-U,-N,-H)
#   -r, --recursive        recurse into directories
#   -l, --links            copy symlinks as symlinks
#   -p, --perms            preserve permissions
#   -t, --times            preserve times
#   -g, --group            preserve group
#       --devices          preserve device files (super-user only)
#       --specials         preserve special files
#   -o, --owner            preserve owner (super-user only)
#   -D                     same as --devices --specials
#
#   -H, --hard-links       preserve hard links
# -u, --update           skip files that are newer on the receiver
# -v, --verbose          increase verbosity
alias rsync="rsync --archive --update --verbose"

# Reload the current shell
alias reload="exec "${SHELL}" -l"

# Show $PATH by line
alias path='echo $PATH | tr ":" "\n"'

# Read stdin line by line instead of spaces.
# It's useful when searching space-separated files.
# ex. ls | readline | xargs grep "foo"
alias readline='while read line; do echo \""$line"\"; done'

# Enable alias
alias sudo="sudo "
alias xargs="xargs "

# Laravel Sail
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
