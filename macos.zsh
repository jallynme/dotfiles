#!/usr/bin/env zsh

echo "\n<<< Starting macOS Setup >>>\n"

osascript -e 'tell application "System Preferences" to quit'

# Finder > Preferences > Show External disks
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# Finder > Preferences > Show Hard disks
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# System Preferences > Dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -int 60

# System Preferences > Keyboard
# The step values that correspond to the sliders on the GUI are as follow (lower equals faster):
# KeyRepeat: 120, 90, 60, 30, 12, 6, 2
# InitialKeyRepeat: 120, 94, 68, 35, 25, 15
defaults write -g KeyRepeat -int 2         # normal minimum is 2 (30 ms)
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)

# System Preferences > Accessibility > Pointer Control > Mouse & Trackpad > Trackpad Options > Enable Dragging > Three Finger Drag (NOTE: The GUI doesn't update)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Set Details Screencapture Location > to Desktop with using Command + Shift + 5.
defaults write com.apple.screencapture location ~/Desktop

# Finish macOS Setup
killall Finder
killall Dock
echo "\n<<< macOS Setup Complete. please restart"
