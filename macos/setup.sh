#!/bin/bash

#[ Finder ]

# Display fullpath in title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all extensions such as (.bak)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Not create icon onto desktop
defaults write com.apple.finder CreateDesktop -boolean false

# Reload
killall Finder

