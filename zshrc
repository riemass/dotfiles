# load zgen
source $HOME/gitstuff/zgen/zgen.zsh

if ! zgen saved; then 

  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'sorin'

  zgen prezto
  zgen prezto git
  zgen prezto syntax-highlighting
  zgen prezto history-substring-search
  zgen prezto command-not-found
  zgen prezto autosuggestions
#  zgen prezto spectrum 

  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load chrissicool/zsh-256color
  zgen load subnixr/minimal
  zgen load rupa/z
  zgen load djui/alias-tips
  zgen load chrissicool/zsh-256color

  zgen save
fi

alias ls='ls --color=auto'

export PATH=$PATH:/home/samir/local_libs/bin:/home/samir/program1/bin:/home/samir/program1/dmd2/linux/bin64
export CDPATH=$CDPATH:$HOME/gitstuff:$HOME
