#------------------------------------------------
# bat / batcat
#------------------------------------------------
# cf. https://github.com/sharkdp/bat

# > On some older Ubuntu/Debian releases, the executable is installed
# > as `batcat` instead of `bat` (due to a name clash with another package).
if command -v batcat > /dev/null 2>&1; then
  alias bat="\\batcat"
fi

if command -v bat > /dev/null 2>&1; then
  # Display help associated with the command with highlighting.
  help() {
    "$@" --help 2>&1 | bat --plain --language=help
  }
fi
