#!/usr/bin/env bash

# disable notification center completely
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
# # reenable Notification Center on mac os x
# launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
# killall NotificationCenter

# take screenshots as jpg (usually smaller size) and not png
defaults write com.apple.screencapture type jpg

# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES

# show Library folder
chflags nohidden ~/Library

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

defaults write com.apple.finder ShowStatusBar -bool true
# enable key repeating
defaults write -g ApplePressAndHoldEnabled -bool false
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# enable key repeat for vscode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

