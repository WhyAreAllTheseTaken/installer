#!/usr/bin/bash
set -e

sudo apt update
./requirements.sh
./get_dotfiles.sh
./install_cli.sh
./install_desktop.sh
./install_apps_arm.sh
./install_dev.sh
./copy_gui_dotfiles.sh
echo "Changing shell"
chsh -s /usr/bin/zsh

