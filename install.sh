#!/usr/bin/bash
set -e

sudo apt update
./requirements.sh
./get_dotfiles.sh
./install_cli.sh
./install_desktop.sh
./install_apps.sh
./copy_gui_dotfiles.sh
./configure_grub.sh

