export ZSH=/home/npicard/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  zsh-autosuggestions
  dnf
  git
  mvn
  adb
  npm
  laravel5
  composer
)

# Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/exports
source $HOME/.zsh/path

unsetopt nomatch

# Disable the annoying <C-s> mapping to suspend terminal
stty -ixon
