# load zgen
source $HOME/gitstuff/zgen/zgen.zsh

if ! zgen saved; then 

  # OhMyZsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/arrow

  # Prezto
# zgen prezto editor key-bindings 'vi'
# zgen prezto prompt theme 'sorin'

  # Repos
# zgen load zsh-users/zsh-completions
# zgen load djui/alias-tips
# zgen load chrissicool/zsh-256color
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search
  zgen load rupa/z

  # Theme
  zgen load subnixr/minimal

  zgen save
fi

ZSH_THEME="minimal"
set -o vi

#alias ls='ls --color=auto'

bindkey -v '^?' backward-delete-char
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export PATH=$PATH:$HOME/custom_libs/bin:$HOME/.local/bin:$HOME/.npm/bin
export CDPATH=$CDPATH:$HOME/gitstuff:$HOME

fix_kbd() {
  setxkbmap -layout "us,ba" -option "grp:alt_shift_toggle,caps:swapescape,keypad:pointerkeys" 
  echo 'keycode 135 = Super_R' | xmodmap -
}

export TERM="xterm-256color"

load_torch() {
  . $HOME/torch/install/bin/torch-activate
}

alias runbuildenv='bash ~/buildenv/startup/start_build_env.sh'
