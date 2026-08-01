# cf. https://github.com/nvm-sh/nvm/issues/2724#issuecomment-1336537635
# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
  return
fi

# Load `nvm`. (for lazy execution to reduce overhead)
_load_nvm() {
  if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
    printf "'nvm' is not found.\n"
    return
  fi

  . "$NVM_DIR/nvm.sh"

  if [[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ]]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/etc/bash_completion.d/nvm"
  fi
}

# Load `nvm` and execute actual `nvm` since then.
nvm() {
  unset -f nvm
  _load_nvm && nvm "$@"
}

# Load `nvm` and execute actual `node` since then.
node() {
  unset -f node
  _load_nvm && node "$@"
}

# Load `nvm` and execute actual `npm` since then.
npm() {
  unset -f npm
  _load_nvm && npm "$@"
}

# Attempt to load `.nvmrc`.
load_nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
