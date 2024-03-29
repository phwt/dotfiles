#!/usr/bin/env bash

set -e

# * General

# Deactivates rubber scrolling:
# http://osxdaily.com/2012/05/10/disable-elastic-rubber-band-scrolling-in-mac-os-x/
defaults write -g NSScrollViewRubberbanding -int 0

# Maximize windows on double clicking them:
defaults write -g AppleActionOnDoubleClick 'Maximize'

# * Dock

defaults write com.apple.dock static-only -bool true # Show only active apps
defaults write com.apple.Dock appswitcher-all-displays -bool true # Show app switcher on all displays
defaults write com.apple.dock autohide-delay -float 0 # Show Dock instantly
defaults write com.apple.dock autohide -bool true # Automatically hide and show the Dock

# * Finder

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Always use expanded save dialog:
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

killall Dock
killall Finder

echo 'Finished configuration'