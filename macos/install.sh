#!/usr/bin/env bash

# Run `defaults help` to display the help

echo "Updating Apple settings..."

#------------------------------------------------
# General
#------------------------------------------------

# Always display the scroll-bar
defaults write -g AppleShowScrollBars -string "Always"
# When the scrollbar is clicked, jump where clicked
defaults write -g AppleScrollerPagingBehavior -bool true

#------------------------------------------------
# Trackpad
#------------------------------------------------

# Tap is equivalent to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# Enable App transition by swiping horizontally with four fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
# Enable App Expose by swiping down with four fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
# Enable dragging with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# Set the scroll direction to "Natural"
defaults write -g com.apple.swipescrolldirection -bool true

#------------------------------------------------
# Finder
#------------------------------------------------

# Show a menu,"Quit Finder" (command + Q)
defaults write com.apple.finder QuitMenuItem -bool true
# Show the fullpath on the title-bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Show all file extensions
defaults write -g AppleShowAllExtensions -bool true
# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Not show a warning of a extension-change
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Not create icons onto the Desktop
defaults write com.apple.finder CreateDesktop -bool false

# Reload
killall Finder

#------------------------------------------------
# Dock
#------------------------------------------------

# Autohide the Dock when the mouse is out
defaults write com.apple.dock autohide -bool true
# Animation-time for showing/hiding the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
# Time until the Dock is displayed
defaults write com.apple.dock autohide-delay -float 0.5
# Not display recent apps
defaults write com.apple.dock show-recents -bool false

#------------------------------------------------
# Mission Control
#------------------------------------------------

# Group windows by application
defaults write com.apple.dock expose-group-apps -bool true
# Not rearrange the full-screen applications automatically
defaults write com.apple.dock mru-spaces -bool false

# Reload
killall Dock

echo -e "\033[32mUpdated.\033[0m If not being reflected, try rebooting."

#------------------------------------------------
# Install Homebrew packages
#------------------------------------------------

( source ~/dotfiles/macos/brew.sh )
