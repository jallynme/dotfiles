#!/usr/bin/env zsh
#
# The missing package manager for MacOS
#
# See https://brew.sh/
#

if [ $(which brew) ]; then
    echo "Homebrew already installed! 😒"
    exit 0
fi

echo "Installing Homebrew ... 🍺 "

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# deactivate google analytics, see https://docs.brew.sh/Analytics
brew analytics off

brew bundle --verbose
echo "Homebrew Done! 🍻 "
