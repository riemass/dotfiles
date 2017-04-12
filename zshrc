# git clone https://github.com/zsh-users/antigen.git /home/amer/gitstuff
source $HOME/gitstuff/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle sudo 
antigen bundle arrow 
antigen bundle rupa/z
antigen bundle docker


antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.

antigen theme S1cK94/minimal minimal

# Tell antigen that you're done.
antigen apply

ZSH_THEME="minimal"
export PATH=$PATH:/home/samir/program1/bin:/home/samir/program1/dmd2/linux/bin64
export CDPATH=$CDPATH:$HOME/gitstuff:$HOME

set -o vi

bindkey -v '^?' backward-delete-char
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

alias e=exit


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

