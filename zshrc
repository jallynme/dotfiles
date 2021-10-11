# Alias commands

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
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Add "zstyles" for Completions & Other Things
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':plugin:history-search-multi-word' clear-on-cancel 'yes'

# Load "New" Completion System

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Add Locations to $path Array

typeset -U path

path=(
  "$N_PREFIX/bin"
  "$ANDROID_SDK/emulator"
  "$ANDROID_SDK/platform-tools"
  "$ANDROID_SDK/tools"
  "$ANDROID_SDK/tools/bin"
  "$HOME/.rbenv/bin"
  "$HOME/flutter/bin"
  "$JAVA_HOME/bin"
  "$GRADLE_HOME/bin"
  $path
)

eval "$(rbenv init -)"
eval "$(starship init zsh)"

