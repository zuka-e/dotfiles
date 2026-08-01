# Change the directory.
cd_main() {
  builtin cd "$@" || return
}

# Process before the directory is changed.
cd_before() {
  true
}

# Process after the directory is changed.
cd_after() {
  printf "→ %s\n" "$(pwd)" && ls
}

# Change the directory with some processing before/after.
cd() {
  cd_before
  cd_main "$@" || return
  cd_after
}

mkdir_cd() {
  \mkdir -p "$@" && cd "$_" || return
}

alias mkdir='mkdir -p'

# i:Interactive, p:Preserve-attributes, r:Recursive, v:Verbose
alias cp='cp -aiv'
alias mv='mv -iv'
alias rm='rm -irv'

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
alias rsync='rsync --archive --update --human-readable --itemize-changes --stats --progress --verbose'

# Reload the current shell
alias reload='exec "$SHELL" -l'

# Show $PATH by line
alias path='printf "%s\n" "$PATH" | tr ":" "\n"'

# Read stdin line by line instead of spaces.
# It's useful when searching space-separated files.
# ex. ls | readline | xargs grep "foo"
readline() {
  while IFS= read -r line; do
    printf '"%s"\n' "$line"
  done
}

# Enable alias
alias sudo='sudo '
alias xargs='xargs '
