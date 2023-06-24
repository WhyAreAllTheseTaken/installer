#!/usr/bin/bash
set -e

sudo apt install zsh nnn htop neofetch cava network-manager

./install_nvim.sh
./copy_cli_dotfiles.sh

