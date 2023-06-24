#!/usr/bin/bash
set -e

sudo apt install ninja-build gettext cmake unzip curl tar libstdc++ gcc

rm -rfv neovim
git clone --branch stable https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build
cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd ../..

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
