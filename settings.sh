#!/usr/bin/env bash

set -e

### General

defaults write -g NSScrollViewRubberbanding -int 0                                     # Deactivates rubber scrolling: http://osxdaily.com/2012/05/10/disable-elastic-rubber-band-scrolling-in-mac-os-x/
defaults write -g AppleActionOnDoubleClick 'Maximize'                                  # Maximize windows on double clicking them
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d HH:mm:ss\"" # Clock format
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true    # Three finger drag

### Dock

defaults write com.apple.dock tilesize -int 16         # Dock size
defaults write com.apple.dock largesize -int 96        # Magnified icon size
defaults write com.apple.dock magnification -bool true # Enable magnification

defaults write com.apple.dock static-only -bool true              # Show only active apps
defaults write com.apple.Dock appswitcher-all-displays -bool true # Show app switcher on all displays
defaults write com.apple.dock autohide-delay -float 0             # Show Dock instantly
defaults write com.apple.dock autohide -bool true                 # Automatically hide and show the Dock

# Hot corners
defaults write com.apple.dock wvous-tl-corner -int 3        # Show application windows
defaults write com.apple.dock wvous-tl-modifier -int 262144 # Control

defaults write com.apple.dock wvous-tr-corner -int 11       # Launchpad
defaults write com.apple.dock wvous-tr-modifier -int 262144 # Control

defaults write com.apple.dock wvous-bl-corner -int 2   # Mission Control
defaults write com.apple.dock wvous-bl-modifier -int 0 # No modifier

defaults write com.apple.dock wvous-br-corner -int 4   # Desktop
defaults write com.apple.dock wvous-br-modifier -int 0 # No modifier

### Finder

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle Nlsv # Set list view as preferred view style
defaults write com.apple.finder FXDefaultSearchScope SCcf # Use the current folder as default search scope
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Always use expanded save dialog
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

### Keybindings

mkdir -p $HOME/Library/KeyBindings
echo '{
  "\UF729" = "moveToBeginningOfLine:"; /* Home */
  "\UF72B" = "moveToEndOfLine:"; /* End */
  "$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
  "$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
  "^\UF729" = "moveToBeginningOfDocument:"; /* Ctrl + Home */
  "^\UF72B" = "moveToEndOfDocument:"; /* Ctrl + End */
  "$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Home */
  "$^\UF72B" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + End */
}' >$HOME/Library/KeyBindings/DefaultKeyBinding.dict

killall Dock
killall Finder

echo 'Finished configuration, reboot required for some changes to take effect'
