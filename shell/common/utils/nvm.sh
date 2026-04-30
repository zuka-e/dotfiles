#!/usr/bin/env bash

# cf. https://github.com/nvm-sh/nvm
# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm

nvm() {
  # When `nvm` is called, this function is executed,
  # remove this and use the real `nvm` from now on.
  unset -f nvm

  if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
  elif [[ -d "${XDG_CONFIG_HOME}/nvm" ]]; then
    export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
  elif [[ -d $(brew --prefix nvm) ]] > /dev/null 2>&1; then
    export NVM_DIR="$(brew --prefix nvm)"
  fi

  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  [ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && \. "$NVM_DIR/etc/bash_completion.d/nvm"

  nvm "$@"
}

# Load the `.nvmrc` if it exists.
load_nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}

load_nvmrc
