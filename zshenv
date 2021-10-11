export ANDROID_AVD_HOME="~/.android/avd"
export ANDROID_HOME=$HOME/Android/sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export DOTFILES="$HOME/dotfiles"
export GRADLE_HOME=/usr/local/opt/gradle
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters


function exists() {
  # `command -v` is similar to `which`
  # https://stackoverflow.com/a/677212/1341838
  command -v $1 >/dev/null 2>&1

  # More explicitly written:
  # command -v $1 1>/dev/null 2>/dev/null
}
