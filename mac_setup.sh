#!/usr/bin/env bash

# disable notification center completely
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
# reenable Notification Center on mac os x
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
killall NotificationCenter

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles YES

