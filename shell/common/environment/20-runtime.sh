# cf. https://github.com/nvm-sh/nvm
# cf. https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
if [[ -d "$HOME/.nvm" ]]; then
  NVM_DIR="$HOME/.nvm"
elif [[ -d "$XDG_CONFIG_HOME/nvm" ]]; then
  NVM_DIR="$XDG_CONFIG_HOME/nvm"
elif [[ -d "$(brew --prefix nvm)" ]] > /dev/null 2>&1; then
  NVM_DIR="$(brew --prefix nvm)"
fi

export NVM_DIR

# cf. `pnpm setup` (https://pnpm.io/cli/setup)
if command -v pnpm > /dev/null 2>&1; then
  # cf. https://github.com/pnpm/pnpm/blob/main/pnpm/crates/config/src/defaults.rs
  if [[ -d "$HOME/Library/pnpm" ]]; then
    PNPM_HOME="$HOME/Library/pnpm"
  elif [[ -d "$HOME/.local/share/pnpm" ]]; then
    PNPM_HOME="$HOME/.local/share/pnpm"
  fi
  export PNPM_HOME
fi

if command -v poetry > /dev/null 2>&1; then
  # cf. https://python-poetry.org/docs/configuration/#virtualenvsin-project
  # VSCode: { "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python" }
  export POETRY_VIRTUALENVS_IN_PROJECT=true
fi
