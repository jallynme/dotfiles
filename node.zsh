#!/usr/bin/env zsh

# Node versions are managed with `n`, which is in the Brewfile.
# See `zshenv` for the setting of the `N_PREFIX` variable,
# thus making it available below during the first install.
# See `zshrc` where `N_PREFIX/bin` is added to `$path`.

if exists $N_PREFIX/bin/node; then
	echo "Node $($N_PREFIX/bin/node --version) & NPM $($N_PREFIX/bin/npm --version) already installed with n"
else
  # make cache folder (if missing) and take ownership
  sudo mkdir -p /usr/local/n
  sudo chown -R $(whoami) /usr/local/n
  # take ownership of node install destination folders
  sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
  # no longer need sudo as you own the folders
	echo "Installing Node & NPM with n..."
	n latest
fi

echo "Installing Global NPM Packages"
# Install Global NPM Packages
npm install -g http-server
npm install -g json-server
npm install -g react-native-cli
npm install -g typescript

echo "Global NPM Packages Installed:"
npm list -g --depth=0
