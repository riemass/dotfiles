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
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/cargo

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
# zgen load rupa/z

  # Theme
  zgen load subnixr/minimal

  zgen save
fi

ZSH_THEME="minimal"
set -o vi

#alias ls='ls --color=auto'
#fpath+=$HOME/zsh_functions

bindkey -v '^?' backward-delete-char
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export PATH=$PATH:$HOME/.local/bin:$HOME/.npm/bin
export CDPATH=$CDPATH:$HOME/gitstuff:$HOME

fix_kbd() {
# setxkbmap -layout "us,ba" -option "grp:alt_shift_toggle,caps:swapescape,keypad:pointerkeys" 
  setxkbmap -layout "us,ba" -option "grp:alt_shift_toggle,caps:swapescape"
  echo 'keycode 135 = Super_R' | xmodmap -
}

export TERM="xterm-256color"

# alias runbuildenv='bash ~/buildenv/startup/start_build_env.sh'
# export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setuprr() {
  echo 'kernel.perf_event_paranoid = 1' | sudo tee -a /etc/sysctl.conf
  sudo sysctl -p
}

# base16
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
# base16

# Wasmer
# export WASMER_DIR="$HOME/.wasmer"
# [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer

PATH=/home/samir/gitstuff/dev_environment/dev-container:/home/samir/gitstuff/dev_environment/release-container:$PATH
