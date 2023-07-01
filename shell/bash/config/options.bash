# See `man bash` for more options.
# - `set -o`: lists all options with `on/off`

#------------------------------------------------
# Shell options
#------------------------------------------------
# cf. `$SHELLOPTS`

set -o noclobber # Restrict overwriting
set -o ignoreeof # Ignore 'logout', only `IGNOREEOF`-times
IGNOREEOF=1

#------------------------------------------------
# Bash optinos
#------------------------------------------------
# cf. `$BASHOPTS`

shopt -s cdspell # Correct spelling for `cd`
