#!/usr/bin/env bash

brew update && brew upgrade

brew install launchctl-completion
brew install bash-completion
brew install vagrant-completion
brew install docker-completion
brew install docker-compose-completion
brew install yarn-completion
brew install pip-completion
brew install openssl
brew install tree
brew install pstree
brew install htop
brew install wget
brew install git
brew install tmux
brew install bat # Alt cat
brew install exa # Alt ls
brew install fd # Alt find
brew install ripgrep # Alt grep, command: rg

brew install yarn
brew install nodenv
brew install pyenv
brew install rbenv

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
