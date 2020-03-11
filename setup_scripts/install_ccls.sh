#! /bin/bash -e

DOWNLOAD_URL='releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz'
LLVM_PATH='~/.local/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04'

if [[ -f /etc/arch-release ]]; then
 echo "Arch Linux detected"
 yay -S ncurses5-compat-libs --noconfirm 
fi

wget $DOWNLOAD_URL
tar xvf  clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz -C "$HOME/.local"
rm clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz

git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$LLVM_PATH -G Ninja
cmake --build Release 
