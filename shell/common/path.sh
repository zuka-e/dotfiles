#!/usr/bin/env bash

# `/etc/path` and `/etc/path.d/` will be applied.
# cf. `/usr/libexec/path_helper -s` in `/etc/profile`

if [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
