export ZSH=/home/npicard/.oh-my-zsh

DEFAULT_USER="npicard"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  zsh-autosuggestions
  archlinux
  git
  gitfast
  mvn
  #adb
  npm
  #laravel5
  #composer
)

# Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/exports
source $HOME/.zsh/path

unsetopt nomatch

# Disable the annoying <C-s> mapping to suspend terminal
stty -ixon

zstyle ':completion:*:*:-command-:*:*' ignored-patterns '_*'

export _JAVA_AWT_WM_NONREPARENTING=1
