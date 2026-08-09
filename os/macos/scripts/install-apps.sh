#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=../../../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../../../shell/common/lib/prompt.sh
. "$DOTFILES_PATH/shell/common/lib/prompt.sh"
# shellcheck source=../../../shell/common/lib/string.sh
. "$DOTFILES_PATH/shell/common/lib/string.sh"
# shellcheck source=../../../shell/common/lib/system.sh
. "$DOTFILES_PATH/shell/common/lib/system.sh"

search_brewfile() {
  local dir="$XDG_CONFIG_HOME/homebrew"
  local brewfile
  brewfile="$(find -E "$dir/" -type f -regex ".*/Brewfile(.local|$)" \
    | sort --version-sort --reverse \
    | head -n 1)"

  if [[ -z "$brewfile" || ! -f "$brewfile" ]]; then
    print_error "Brewfile doesn't exist in '$XDG_CONFIG_HOME/homebrew'."
    exit 2
  fi

  printf '%s\n' "$brewfile"
}

#------------------------------------------------
# Install Homebrew
#------------------------------------------------

if ! command -v brew > /dev/null 2>&1; then
  print_info 'Homebrew is not installed. Installing...'

  # cf. https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit
fi

#------------------------------------------------
# Install Homebrew packages
#------------------------------------------------

brew doctor || exit

print_bold 'Checking the installation status of Homebrew...'

requirement_file="$(search_brewfile)"

print_bold "'$requirement_file' has been loaded."
print_default 'Loading installed packages...'

current_file="$TMPDIR/Brewfile"

brew bundle dump -f --file="$current_file"

installed="$(cat "$current_file" | normalize_list)"
required="$(cat "$requirement_file" | normalize_list)"

adding="$(comm -13 <(printf '%s\n' "$installed") <(printf '%s\n' "$required"))"
removing="$(comm -23 <(printf '%s\n' "$installed") <(printf '%s\n' "$required"))"

if [[ -n $adding ]]; then
  print_bold_green 'The following will be added.'
  print_default '==========================================='
  print_bold_green "$adding"
  print_default '==========================================='
fi

if [[ -n "$removing" ]]; then
  print_bold_red 'The following will be removed.'
  print_default '==========================================='
  print_bold_red "$removing"
  print_default '==========================================='
fi

if [[ ! -n "$adding" && ! -n "$removing" ]]; then
  print_info 'All packages are already installed. Upgrade process will be started.'
else
  print_info 'Upgrade process will also be started.'
fi

if ! confirm 'Do you want to continue?'; then
  exit
fi

# Install packages based on `Brewfile`,
# and remove those installed with `brew` and not listed in the file.
brew bundle -v --file="$requirement_file"
# Remove unnecessary dependencies
# cf. https://docs.brew.sh/Manpage#autoremove---dry-run
brew autoremove -v
# Remove stale lock files, outdated downloads, and caches.
# cf. https://docs.brew.sh/Manpage#cleanup-options-formulacask-
brew cleanup -v --scrub

#------------------------------------------------
# `phpenv`
#------------------------------------------------
# For installation, see https://github.com/phpenv/phpenv-installer
# The following settings are probably required for installation of PHP.
# PHP_RPATHS="$(brew --prefix bzip2)" PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv)" phpenv install 8.0.9

#------------------------------------------------
# Change Shell into local Zsh
#------------------------------------------------

shell="$HOMEBREW_PREFIX/bin/zsh"

if [[ "$(login_shell)" != "$shell" ]]; then
  change_shell "$shell"
fi
