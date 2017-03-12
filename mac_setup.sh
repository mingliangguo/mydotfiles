#!/usr/bin/env bash

# disable notification center completely
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
# reenable Notification Center on mac os x
launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
killall NotificationCenter

