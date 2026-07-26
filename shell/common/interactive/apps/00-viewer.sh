# cf. `$HOME/.config/bat`

#-----------------------------------------
# > In this package the executable and its manpage have been renamed
# > from ‘bat’ to ‘batcat’ because of a file name clash with another Debian package.
if command -v batcat > /dev/null 2>&1; then
  alias bat="\\batcat"
fi
#-----------------------------------------
