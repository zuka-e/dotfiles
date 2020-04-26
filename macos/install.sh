#!/bin/bash

# ref. "http://neos21.hatenablog.com/entry/2019/01/10/080000"
# ref. "http://tukaikta.blog135.fc2.com/blog-entry-251.html"


#[ System ]
# Always Show a scroll-bar 
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

#[ Finder ]
# Show a menu,"Quit Finder" (command + Q)
defaults write com.apple.finder QuitMenuItem -bool true
# Show the fullpath on the title-bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Not show a warning of a extension-change
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Not create icons onto the Desktop
defaults write com.apple.finder CreateDesktop -bool false
# Reload
killall Finder

#[ Dock ]
# Animation-time for showing/hiding the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
# Time until the Dock is displayed
defaults write com.apple.dock autohide-delay -float 0.5 
# Reload
killall Dock

