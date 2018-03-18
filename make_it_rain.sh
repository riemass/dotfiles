#!/bin/bash

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
	qemu \
	qemu-arch-extra \
	python-setuptools \
	python2-setuptools \
	python-pip \
	python2-pip \
	neovim \
	python-neovim \
	python2-neovim \
	cmake \
	zsh \
	rxvt-unicode \
	help2man

# setup pip, python and neovim 

pip2 install --upgrade --user pip
pip install --upgrade --user pip
pip2 install --user neovim
pip install --user neovim

# will be needed later
mkdir ~/gitstuff
#mkdir -p ~/.config/autostart


#     caps-swapescape
mkdir -p ~/.config/autostart
cp kbd.desktop ~/.config/autostart/

#     neovim
mkdir -p ~/.config/nvim/

# getting vim-plug to where it belongs
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#ln -s `pwd`/init.vim ~/.config/nvim/init.vim

#nvim -c 'PlugInstall' -c 'qa!'

# making the base16 colorschemes accualy look good in terminal and vim 
#git clone https://github.com/chriskempson/base16-shell.git \
#   ~/.config/base16-shell

#mkdir -p ~/.config/nvim/colors

#git clone git://github.com/chriskempson/base16-vim.git  \
    #~/gitstuff/base16-vim
#cp ~/gitstuff/base16-vim/colors/*.vim ~/.config/nvim/colors/
cp init.vim ~/.config/nvim/init.vim

nvim -c 'PlugInstall' -c 'qa!'

# making the base16 colorschemes accualy look good in terminal and vim 
# git clone https://github.com/chriskempson/base16-shell.git \
   # ~/.config/base16-shell

# mkdir -p ~/.config/nvim/colors
#
# git clone git://github.com/chriskempson/base16-vim.git  \
#     ~/gitstuff/base16-vim
# cp ~/gitstuff/base16-vim/colors/*.vim ~/.config/nvim/colors/


#     gitstuff, fonts, terminal and zsh

mkdir ~/gitstuff
pushd ~/gitstuff
git clone https://github.com/powerline/fonts
popd

# fzf creates a .zshrc
rm ~/.zshrc
# git clone https://github.com/mesonbuild/meson.git
git clone https://github.com/tarjoilija/zgen
git clone https://github.com/powerline/fonts
popd

mkdir ~/.fonts
ln -s $HOME/gitstuff/fonts/* $HOME/.fonts/

# build stuff for projects
sudo pip install meson
sudo pip2 install conan 

# fzf from nvim creates a .zshrc
rm ~/.zshrc
cp zshrc ~/.zshrc

ln -s `pwd`/gitstuff/fonts $(HOME)/.fonts/
ln -s $HOME/gitstuff/fonts ~/.fonts
chsh -s `which zsh`
