export ZSH=/home/npicard/.oh-my-zsh

ZSH_THEME="robbyrussell"
#DEFAULT_USER="npicard"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git dnf mvn z adb)


# Options
setopt autocd # .. is shortcut for cd .. (etc)
setopt autoparamslash # tab completing directory appends a slash
setopt sharehistory # share history across shells


source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/exports
source $HOME/.zsh/path
