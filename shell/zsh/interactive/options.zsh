# cf. `man zshoptions`.
# - `set -o`: all options with `on/off`
# - `setopt`: enabled options
# - `unsetopt`: disabled options

# Prevent from being overwritten by `>`.
setopt NO_CLOBBER

# Create a missing file for `>>`.
setopt APPEND_CREATE

# `Ctrl-D` 10 times or run `exit` to exit.
setopt IGNORE_EOF
