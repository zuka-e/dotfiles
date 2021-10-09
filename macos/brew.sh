#!/usr/bin/env bash

brew update && brew upgrade

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

#  Basic Command
brew install bash
brew install openssl
brew install tree
brew install pstree
brew install htop
brew install wget
brew install git
brew install tmux

#  Advanced Command
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
