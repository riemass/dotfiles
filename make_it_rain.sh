#!/bin/bash -x

# Samir's basic configuration
# Manjaro linux, xfce
# highly non-portable and system dependable

### SYSTEM UPDATE
sudo pacman -Syu --noconfirm --needed

# install basic development tools
sudo pacman -S --noconfirm --needed \
	gdb \
	clang \
	clang-tools-extra \
	python-setuptools \
	python2-setuptools \
	python-pip \
	python2-pip \
  docker \
  yay \
	alacritty \
	python2-pip \
	neovim \
	python-neovim \
	ninja \
	nodejs \
	npm \
	yarn \
	cmake \
	zsh

# setup pip, python and neovim 
pip2 install --upgrade --user pip
pip install --upgrade --user pip
pip2 install --user neovim
pip install --user neovim

# will be needed later
mkdir ~/gitstuff
mkdir -p ~/.config/autostart
mkdir -p ~/.config/nvim/

#  caps-swapescape
cp kbd.desktop ~/.config/autostart/

#  neovim
# getting vim-plug to where it belongs
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# making the base16 colorschemes accualy look good in terminal and vim 
if [[ -d ~/.config/base16-shell ]]; then
	rm -rf ~/.config/base16-shell
fi 
if [[ -d ~/gitstuff/zgen ]]; then
	rm -rf ~/gitstuff/zgen
fi 
if [[ -d ~/gitstuff/fonts ]]; then
	rm -rf ~/gitstuff/fonts
fi 

git clone https://github.com/chriskempson/base16-shell.git \
   ~/.config/base16-shell

mkdir -p ~/.config/nvim/colors
cp ~/gitstuff/base16-vim/colors/*.vim ~/.config/nvim/colors/

cp init.vim ~/.config/nvim/
mkdir -p ~/.config/nvim/scripts
cp spacetab.vim ~/.config/nvim/
cp coc-settings.json ~/.config/nvim/scripts
nvim -c 'PlugInstall' -c 'qa!' --headless
nvim -c 'CocInstall coc-snippets' -c 'qa!' --headless
nvim -c 'CocInstall coc-rls' -c 'qa!' --headless

cp alacritty.yml ~/.config/alacritty/alacritty.yml

pushd ~/gitstuff
git clone https://github.com/tarjoilija/zgen
git clone https://github.com/powerline/fonts
popd

mkdir ~/.fonts
ln -s $HOME/gitstuff/fonts/* $HOME/.fonts/

# build stuff for projects
sudo pip install meson 
# fzf from nvim creates a .zshrc
rm ~/.zshrc
cp zshrc ~/.zshrc

sudo usermod -aG docker $USER

sudo systemctl enable sshd
sudo systemctl enable docker
sudo systemctl start sshd

fc-cache

chsh -s `which zsh`
