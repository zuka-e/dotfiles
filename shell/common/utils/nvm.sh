#!/usr/bin/env bash

# cf. https://github.com/nvm-sh/nvm
# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm

nvm() {
  # When `nvm` is called, this function is executed,
  # remove this and use the real `nvm` from now on.
  unset -f nvm

  export NVM_DIR=~/.nvm

  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  if type brew > /dev/null 2>&1; then
    nvm_path=$(brew --prefix nvm)

    [ -s "$nvm_path/etc/bash_completion.d/nvm" ] && \. "$nvm_path/etc/bash_completion.d/nvm"

    unset nvm_path
  fi

  nvm "$@"
}

load_nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}

# When the directory is changed, load the nvm version specified in `.nvmrc`.
add-zsh-hook chpwd load_nvmrc

# Load the nvm version specified in `.nvmrc`. (in case of directory is not changed)
load_nvmrc
