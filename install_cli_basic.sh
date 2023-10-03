#!/usr/bin/bash
set -e

sudo apt install -y zsh nnn htop neofetch

./install_nvim.sh
./copy_cli_dotfiles.sh

