#------------------------------------------------
# XDG Base Directory
#------------------------------------------------
# cf. https://wiki.archlinux.org/title/XDG_Base_Directory

# Path to configurations (cf. `/etc`)
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Path to non-essential data (cf. `/var/cache`)
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Path to data files (cf. `/usr/share`)
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Path to user-specific state such as logs or history (cf. `var/lib`)
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
