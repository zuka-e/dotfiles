# For details of options, see `man zshoptions`.
# - `set -o`: lists all options with `on/off`
# - `setopt`: lists enabled options

set -o noclobber # `NO_CLOBBER`: Prevent from being overwritten by `>`.
set -o ignoreeof # `IGNORE_EOF`: `Ctrl-D` 10 times or run `exit` to exit.
