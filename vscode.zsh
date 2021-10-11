#!/usr/bin/env zsh
#
#  VS Code Extensions
#
sudo ln -fs "$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
echo "Linked Shell 'code' command for PATH"
echo "Installing VS Code Extensions"
cat vscode_extensions | xargs -L 1 code --install-extension
echo " 🎉  VS Code Extension installed🎉"
