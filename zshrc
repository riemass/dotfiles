source $HOME/gitstuff/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle docker
antigen bundle extract
antigen bundle cargo

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestion
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# PATH="${PATH}:${HOME}/gitstuff/dev_environment_ubuntu/dev-container-ubuntu/"

function chpwd {
    pwd > ~/.last_dir
}

if [[ -f ~/.last_dir ]]; then
    cd $(cat ~/.last_dir)
fi
