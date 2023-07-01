#!/usr/bin/env bash

source ~/dotfiles/shell/functions.sh

if ! brew doctor; then
  exit 2
fi

current_file="$TMPDIR/Brewfile"

has_apple_silicon &&
  updated_file=~/dotfiles/macos/arm64/Brewfile ||
  updated_file=~/dotfiles/macos/x86_64/Brewfile

if [[ ! -f "$updated_file" ]];then
  echo "\"$updated_file\" doesn't exist."
  exit 2
fi

echo "Loading installed packages..."
brew bundle dump -f --file="$current_file"

# Remove comments, dup, and blank lines, and sort a file.
function format_file {
  sed -E -e "s/#.*//" -e "/^\s*$/d" "${1}" | sort | uniq
}

function diff_brewfile {
  # `<()`: Process Substitution
  diff -u \
    --ignore-blank-lines \
    --ignore-space-change \
    <(format_file "$current_file") \
    <(format_file "$updated_file")
}

# Packages to be added.
added_packages=$(diff_brewfile | egrep "^\+\s*\w+")
# Packages to be removed.
removed_packages=$(diff_brewfile | egrep "^\-\s*\w+")

if [[ ! -z $removed_packages ]]; then
  echo
  echo -e "\033[31mThe following packages will be removed.\033[0m"
  echo "==========================================="
  echo "$removed_packages"
  echo "==========================================="
fi

if [[ ! -z $added_packages ]]; then
  echo
  echo -e "\033[32mThe following packages will be installed.\033[0m"
  echo "==========================================="
  echo "$added_packages"
  echo "==========================================="
fi

if [[ -z $added_packages && -z $removed_packages ]]; then
  echo "Already up-to-date."
else
  echo
  while true; do
    read -p "Are you sure to continue? (y/N) " input
    case $input in
      y|yes)
        # Install packages based on `Brewfile`,
        # and remove those installed with `brew` and not listed in the file.
        brew bundle -v --cleanup --file="$updated_file"
        # Remove unnecessary dependencies
        # cf. https://docs.brew.sh/Manpage#autoremove---dry-run
        brew autoremove
        # Remove stale lock files, outdated downloads, and caches.
        # cf. https://docs.brew.sh/Manpage#cleanup-options-formulacask-
        brew cleanup -vs --prune=all
        break;;
      N|no|No|"")
        echo "Canceled."
        break;;
      *)
        echo "Please answer with y or N.";;
    esac
  done
fi

#------------------------------------------------
# `phpenv`
#------------------------------------------------
# For installation, see https://github.com/phpenv/phpenv-installer
# The following settings are probably required for installation of PHP.
# PHP_RPATHS="$(brew --prefix bzip2)" PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv)" phpenv install 8.0.9

#------------------------------------------------
# Change Shell into local Zsh
#------------------------------------------------

usr_zsh="$HOMEBREW_PREFIX/bin/zsh"
shells='/etc/shells'

if [[ $SHELL != $usr_zsh && "$(which zsh)" = $usr_zsh ]]; then
  if ! grep $usr_zsh '/etc/shells' > /dev/null 2>&1; then
    echo "Enter the password to add '${usr_zsh}' to '${shells}'"
    echo $usr_zsh | sudo tee -a /etc/shells > /dev/null

    if [[ $? == 0 ]]; then
      echo "Added $usr_zsh to '/etc/shells'"
    else
      echo "Canceled the operation"
    fi
  fi

  chsh -s $usr_zsh

  if [[ $? == 0 ]]; then
    echo "Changed the login shell to ${usr_zsh}'."
    export SHELL=$usr_zsh
    exec $SHELL -l
  fi
fi

unset usr_zsh shells
