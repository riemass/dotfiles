#! /bin/bash

sudo pacman --noconfirm --needed -Syyu
sudo pacman --noconfirm --needed -S base-devel neovim tlp gdb docker alacritty \
			ninja nodejs npm yarn cmake zsh rustup python-pip meson tlp-rdw smartmontools \
			ethtool starship jq fzf bat zoxide

if ! command -v pandoc &> /dev/null
then
	echo "Installing pandoc 3.1.2"
	curl -sL https://github.com/jgm/pandoc/releases/download/3.1.2/pandoc-3.1.2-linux-amd64.tar.gz  |  
		tar -xz -C ~/.local --strip-components=1
fi

sudo pip install meson 
sudo usermod -aG docker $USER
sudo systemctl enable tlp
