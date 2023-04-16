export PATH="/usr/local/sbin:$PATH"

if type nodenv > /dev/null 2>&1; then
  export PATH="$PATH:$HOME/.nodenv/bin"
  eval "$(nodenv init -)"
fi

if type pyenv > /dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PATH:$PYENV_ROOT/bin"
  eval "$(pyenv init --path)"
fi

if type rbenv > /dev/null 2>&1; then
  export PATH="$PATH:$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
fi

if [[ -x ~/.phpenv/bin/phpenv ]]; then
  export PATH="$PATH:$HOME/.phpenv/bin"
  eval "$(phpenv init -)"
fi
