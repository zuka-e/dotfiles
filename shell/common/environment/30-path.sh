# cf. `/etc/path`, `/etc/path.d/`
# cf. `/usr/libexec/path_helper -s` executed within `/etc/profile`

# shellcheck source=../lib/path.sh
. "$DOTFILES_PATH/shell/common/lib/path.sh"

# cf. `pipx ensurepath` - https://pipx.pypa.io/latest/how-to/install-pipx.html
path_append "$HOME/.local/bin"

# cf. https://docs.brew.sh/Installation#post-installation-steps
if command -v brew > /dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

# cf. `pnpm setup` - https://pnpm.io/cli/setup
if [[ -d "$PNPM_HOME/bin" ]]; then
  path_prepend "$PNPM_HOME/bin"
fi

# cf. https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
if command -v pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  # shellcheck source=/dev/null
  . "$HOME/.cargo/env"
fi

export PATH
