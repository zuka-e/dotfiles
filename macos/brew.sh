#!/usr/bin/env bash

brew update && brew upgrade && brew doctor

#------------------------------------------------
# Formulae
#------------------------------------------------

# Completion
brew install bash-completion@2
brew install brew-cask-completion
brew install launchctl-completion
brew install open-completion
brew install vagrant-completion
brew install docker-completion
brew install docker-compose-completion
brew install yarn-completion
brew install pip-completion

# Basic Command
brew install bash
brew install openssl
brew install tree
brew install pstree
brew install htop
brew install wget
brew install tmux
brew install rsync
brew install git

# Advanced Command
brew install bat # Alt cat
brew install exa # Alt ls
brew install fd # Alt find
brew install ripgrep  # (rg) Alt grep

# X-env
brew install nodenv
brew install pyenv
brew install rbenv
# The following processes are probably required for phpenv
# curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer | bash
# brew install bzip2
# brew install libiconv
# brew install oniguruma
# brew install tidy-html5
# brew install libzip
# PHP_RPATHS="$(brew --prefix bzip2)" PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv)" phpenv install 8.0.9

# AWS
brew install awscli

# Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Miscellaneous
brew install ffmpeg
brew install yarn

#------------------------------------------------
# Casks
#------------------------------------------------

# Basic
brew install --cask clipy
brew install --cask karabiner-elements
brew install --cask google-japanese-ime
brew install --cask google-chrome
brew install --cask libreoffice

# Developer
brew install --cask docker
brew install --cask virtualbox
brew install --cask vagrant
brew install --cask visual-studio-code

# Database
brew install --cask sequel-ace
brew install --cask mysqlworkbench
brew install --cask pgadmin4

# Communication
brew install --cask slack
brew install --cask skype
brew install --cask microsoft-teams

# Miscellaneous
brew install --cask android-file-transfer
brew install --cask kindle
brew install --cask send-anywhere
brew install --cask iina

#------------------------------------------------
# Change Shell into local Bash
#------------------------------------------------

usr_bash='/usr/local/bin/bash'
etc_shells='/etc/shells'

if [[ $SHELL != $usr_bash && "$(which bash)" = $usr_bash ]]; then
  if ! grep $usr_bash '/etc/shells' > /dev/null 2>&1; then
    echo "Enter the password to add '${usr_bash}' to '${etc_shells}'"
    echo $usr_bash | sudo tee -a /etc/shells > /dev/null

    if [[ $? == 0 ]]; then
      echo "Added $usr_bash to '/etc/shells'"
    else
      echo "Canceled the operation"
    fi
  fi

  chsh -s $usr_bash
fi

unset usr_bash etc_shells
