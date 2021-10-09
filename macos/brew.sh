#!/usr/bin/env bash

brew update && brew upgrade

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

# Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Miscellaneous
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
