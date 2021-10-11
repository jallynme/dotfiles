## Restore Instructions

1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. `git clone https://github.com/jallynme/dotfiles.git ~/dotfiles`
3. `cd ~/dotfiles`
4. [`./install`](install)
5. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

    ```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t rsa -b 4096 -C "5990717+jallynme@users.noreply.github.com"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa
    EOF

    # Add private key to ssh-agent
    ssh-add -K ~/.ssh/id_rsa

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_rsa.pub

    # Test SSH connection, then verify fingerprint and username
    # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
    ssh -T git@github.com
    # Hi jallynme! You've successfully authenticated, but GitHub does not provide shell access.


    # Switch from HTTPS to SSH
    git remote set-url origin git@github.com:jallynme/dotfiles.git
    ```
<br/>

# Create a bootable USB installer for macOS
### How to create a bootable installer for macOS check this [link](https://support.apple.com/en-us/HT201372)
<br/>

# Setup New Machine without dotfile

## Create Working directory

```
mkdir ~/Workspace
mkdir ~/dotfiles
```

## Change shell

```
chsh -s /bin/zsh

```

## Add Z-shell resource

```
touch  ~/.zshrc
```

## Reload Z-shell resource

```
source  ~/.zshrc
```

## Create alias

```
alias ls='ls -lAFh'
```

## Use Original Command

```
command ls
```

## Show Manual

```
man ls
```

## Customize Prompts

```
PROMPT='%n@%m %1~ %#'
```

> e.g jeremy@Jeremys-MacBook-Pro ~ % this is default PROMPT of MacOS

```
RPROMPT='%*'
```

> RPROMPT is a stand for rightside of prompt %\* is for showing time

## Example

```
 mkdc() {
     mkdir -p "$@" && cd "$_"
 }
```

> @ is the first argument of command \_ is the last argument

## Install XCode command line tools

```
sudo xcodebuild -license accept
xcode-select --install
```

## Setup Git

```
git config --global user.name "Jeremy"
git config --global user.email "5990717+jallynme@users.noreply.github.com"
mv ~/.gitconfig ~/dotfiles/gitconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
```

<br/>

## Setup Dotbot

```
cd  ~/dotfiles/
git submodule add https://github.com/anishathalye/dotbot
git config -f .gitmodules submodule.dotbot.ignore dirty
cp dotbot/tools/git-submodule/install .
nano install.conf.yaml
```

```
- defaults:
    link:
      relink: true

- clean: ['~']

- link:
    ~/.config:
    ~/.gitconfig:
    ~/.zshenv:
    ~/.zshrc:


- create:
    - ~/Workspace

- shell:
  -
   command: echo "Installing XCode Command Line Tools"
   stdin: true
   stdout: true
   stderr: true
   description: this command will install & accept xcodebuild license \n
  - echo "Installing Homebrew"
  - echo "Installing VS Code Extension"
```

> [Details](https://github.com/anishathalye/dotbot)

# Homebrew

## Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Uninstall Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

```

## Personal Package Lists

```
brew install ack
brew install bat
brew install bash
brew install chromedriver
brew install cmake
brew install exa
brew install gh
brew install goenv
brew install go
brew install kubernetes-cli
brew install mas
brew install n
brew install node
brew install openjdk@11
brew install rbenv
brew install ruby
brew install redis
brew install tldr
brew install tmux
brew install tree
brew install postgresql
brew install pyenv
brew install python@3.9
brew install sqlite
brew install unzip
brew install vim
brew install watchman
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-syntax-highlighting



brew tap homebrew/cask-fonts
brew install --cask android-studio
brew install --cask appcleaner
brew install --cask cleanmymac
brew install --cask discord
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask flutter
brew install --cask font-hack-nerd-font
brew install --cask free-download-manager
brew install --cask google-chrome
brew install --cask postman
brew install --cask slack
brew install --cask spotify
brew install --cask tableplus
brew install --cask unetbootin
brew install --cask visual-studio-code
brew install --cask vlc


mas "DevCleaner", id: 1388020431
mas "Developer", id: 640199958
mas "HazeOver", id: 430798174
mas "HiddenMe", id: 467040476
mas "Keynote", id: 409183694
mas "Kindle", id: 405399194
mas "LINE", id: 539883307
mas "LiquidText", id: 922765270
mas "Magnet", id: 441258766
mas "Messenger", id: 1480068668
mas "Microsoft Excel", id: 462058435
mas "Microsoft OneNote", id: 784801555
mas "Microsoft PowerPoint", id: 462062816
mas "Microsoft Word", id: 462054704
mas "Numbers", id: 409203825
mas "Pages", id: 409201541
mas "Redis Server", id: 972359186
mas "Shazam", id: 897118787
mas "Slack", id: 803453959
mas "Telegram", id: 747648890
mas "Transporter", id: 1450874784
mas "Xcode", id: 497799835





```

### VSCODE

## Export Visual Studio Code Extensions

```
cd ~/.dotfiles
code --list-extensions > vscode_extensions

touch  ~/.dotfiles/vscode.zsh
chmod +x ~/.dotfiles/vscode.zsh


```
