#!/usr/bin/bash
set -e

sudo apt update
./requirements.sh
./get_dotfiles.sh
./install_cli_basic.sh
./install_dev_amd64.sh
echo "Changing shell"
chsh -s /usr/bin/zsh


