export ZSH=/home/npicard/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  zsh-completions
  zsh-autosuggestions
  dnf
  git
  mvn
  z
  adb
)

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/exports
source $HOME/.zsh/path

# Disable the annoying <C-s> mapping to suspend terminal
stty -ixon
