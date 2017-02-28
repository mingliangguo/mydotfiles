#!/usr/bin/env bash

# disable notification center completely
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
# reenable Notification Center on mac os x
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
killall NotificationCenter

# setup vim and macvim

brew rm vim vim python macvim
brew install python
brew install vim --with-override-system-vi
brew install macvim --with-override-system-vim
sudo brew linkapps macvim



