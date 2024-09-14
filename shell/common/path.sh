#!/usr/bin/env bash

# `/etc/path` and `/etc/path.d/` will be applied.
# cf. `/usr/libexec/path_helper -s` in `/etc/profile`

if [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Originally created by `pnpm setup`
# cf. https://pnpm.io/cli/setup
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# cf. https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
