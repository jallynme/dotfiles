#!/usr/bin/env zsh
#
# Xcode Command Line Tools
#

if xcode-select --print-path &>/dev/null; then
    echo "Xcode Command Line Tools already installed! 😒"
    exit 0
fi

echo "Installing Xcode Command Line Tools"

# Prompt user to install the Xcode Command Line Tools
xcode-select --install &>/dev/null

# Wait until the Xcode Command Line Tools are installed
until xcode-select --print-path &>/dev/null; do
    sleep 5
done

print_result $? 'Install Xcode Command Line Tools'

# Point the `xcode-select` developer directory to the appropriate directory from within `Xcode.app`
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
print_result $? 'Make "xcode-select" developer directory point to Xcode'

sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch

echo " 🎉  Xcode Command Line Tools installed 🎉"
