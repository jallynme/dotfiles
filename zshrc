# Alias commands

alias aem="emulator -avd Pixel_3a_API_31_arm64-v8a"
alias bbd="brew bundle dump --all --force --describe"
alias bi="brew install --no-quarantine"
alias bui="brew uninstall "
alias cat="bat"
alias cna="npx create-next-app@latest"
alias cra="npx create-react-app@latest"
alias eml="emulator -list-avds"
alias exa="exa -laFh --git"
alias grep="ack"
alias kbc="kubectl"
alias ls="exa"
alias lsg="exa | grep"
alias man="tldr"
alias mnk="minikube"
alias redis="redis-cli"
alias rn="npx react-native"
alias rnra="rn run-android"
alias rnri="rn run-ios"
alias s="source ~/.zshrc"
alias t="tree -L 2"
alias tree="tree -L 2"

# Git
alias gcm="git add . && git commit -am "
alias gco="git checkout"
alias gpull="git pull"
alias gpush="git push"

# Use ZSH Plugins
if [[ $(uname -m) == 'arm64' ]]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Add "zstyles" for Completions & Other Things
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':plugin:history-search-multi-word' clear-on-cancel 'yes'

# Load "New" Completion System

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  if [[ $(uname -m) == 'x86_64' ]]; then
    compinit
  fi
fi

# Add Locations to $path Array

typeset -U path

path=(
  "$N_PREFIX/bin"
  "$ANDROID_SDK_HOME/emulator"
  "$ANDROID_SDK_HOME/platform-tools"
  "$ANDROID_SDK_HOME/tools"
  "$ANDROID_SDK_HOME/tools/bin"
  "$HOME/.rbenv/bin"
  "$HOME/flutter/bin"
  "$JAVA_HOME/bin"
  "$GRADLE_HOME/bin"
  "$FLUTTER_HOME/bin"
  $path
)

eval "$(rbenv init -)"
eval "$(starship init zsh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
