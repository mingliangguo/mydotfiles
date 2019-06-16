#!/usr/bin/env bash

# disable notification center completely
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
# reenable Notification Center on mac os x
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
killall NotificationCenter

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles YES
# enable key repeating
defaults write -g ApplePressAndHoldEnabled -bool false
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
