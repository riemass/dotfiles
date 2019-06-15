sudo apt-get install  \
		cmake clang clang-format libpython-dev \
		python-setuptools python3-setuptools \
		global ctags zsh git curl libcurl4-openssl-dev \
		google-mock ccache

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update

sudo apt install python-pip
sudo apt install python3-pip

sudo apt-get install neovim

export PATH=$PATH:~/.local/bin

pip install --upgrade --user pip
pip3 install --upgrade --user pip
pip install --user neovim
pip3 install --user neovim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
