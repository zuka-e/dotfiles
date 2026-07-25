#!/usr/bin/env bash

# shellcheck source=../../../shell/common/lib/log.sh
. "$DOTFILES_PATH/shell/common/lib/log.sh"
# shellcheck source=../../../shell/common/lib/system.sh
. "$DOTFILES_PATH/shell/common/lib/system.sh"

#------------------------------------------------
# Install Homebrew
#------------------------------------------------

if ! type brew > /dev/null 2>&1; then
  # cf. https://brew.sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  elif [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    exit 2
  fi
fi

#------------------------------------------------
# Install Homebrew packages
#------------------------------------------------

brew doctor || exit

print_bold 'Checking the installation status of Homebrew...'

# A Brewfile based on desired packages.
new_file=$(
  find -E "$DOTFILES_PATH/os/macos" -type f -regex ".*$(uname -m)/Brewfile(.local|$)" \
    | sort --version-sort --reverse \
    | head -n 1
)

if [[ ! -f "$new_file" ]]; then
  print_error "Brewfile doesn't exist."
  exit 2
fi

print_bold "'$new_file' has been loaded."
print_default 'Loading installed packages...'

# A Brewfile based on teinstalled packages.
current_file="$TMPDIR/Brewfile"

brew bundle dump -f --file="$current_file"

# Remove comments, dup, and blank lines, and sort a file.
function format_file {
  sed -E -e 's/#.*//' -e '/^\s*$/d' "${1}" | sort | uniq
}

function diff_brewfile {
  # `<()`: Process Substitution
  diff -u \
    --ignore-blank-lines \
    --ignore-space-change \
    <(format_file "$current_file") \
    <(format_file "$new_file")
}

# Packages to be added.
added_packages=$(diff_brewfile | egrep '^\+\s*\w+')
# Packages to be removed.
removed_packages=$(diff_brewfile | egrep '^\-\s*\w+')

if [[ ! -z $removed_packages ]]; then
  print_default
  print_bold_red 'The following packages will be removed.'
  print_default '==========================================='
  print_default "$removed_packages"
  print_default '==========================================='
fi

if [[ ! -z $added_packages ]]; then
  print_default
  print_bold_green 'The following packages will be installed.'
  print_default '==========================================='
  print_default "$added_packages"
  print_default '==========================================='
fi

if [[ -z $added_packages && -z $removed_packages ]]; then
  print_info 'All packages are already installed but may be upgraded.'
else
  print_info 'Other packages might also be upgraded.'
fi

while true; do
  read -p 'Are you sure to continue? (y/N) ' input
  case $input in
    y | yes)
      # Install packages based on `Brewfile`,
      # and remove those installed with `brew` and not listed in the file.
      brew bundle -v --cleanup --file="$new_file"
      # Remove unnecessary dependencies
      # cf. https://docs.brew.sh/Manpage#autoremove---dry-run
      brew autoremove
      # Remove stale lock files, outdated downloads, and caches.
      # cf. https://docs.brew.sh/Manpage#cleanup-options-formulacask-
      brew cleanup -vs --prune=all
      break
      ;;
    N | no | No | '')
      print_default 'Canceled.'
      exit
      ;;
    *)
      print_default 'Please answer with y or N.'
      ;;
  esac
done

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
