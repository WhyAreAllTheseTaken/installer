#!/usr/bin/bash
set -e

# Updated packages
sudo apt update
sudo apt list --upgradeable
sudo apt upgrade

# Requirements
./requirements.sh

# Get latest dot files
./get_dotfiles.sh

# Basic CLI tools
sudo apt install -y zsh nnn htop neofetch

## Setup CLI
./install_advcpmv.sh
./install_nvim.sh

./copy_cli_dotfiles.sh

arch=$(uname -m)

if [[ "desktop" == $1 ]]; then
    ./install_desktop.sh

    ./install_aseprite.sh
    
    ./copy_gui_dotfiles.sh
fi

if [[ $arch == "x86_64" || $arch == "x64" ]]; then
    echo "Detected amd64";
    
    ./install_java_amd64.sh
elif [[ $arch == "aarch64" || $arch = "arm64" ]]; then
    echo "Detected aarch64";

    ./install_java_arm.sh
else
    echo "Unknown CPU architecture: $arch.";
fi

# Update texlive
sudo apt install -y texlive

# Update rust
rustup update

# Update haskell
if ! command -v ghcup
then
    sudo apt install -y libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
    set BOOTSTRAP_HASKELL_NONINTERACTIVE=1
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
else
    ghcup upgrade
fi

# Install Prolog and ruby
sudo apt install -y swi-prolog ruby-full

# Install PHP
sudo apt install -y php-cli

if ! command -v composer
then 
    rm -fv composer-setup.php
    rm -fv composer.phar 
    wget --show-progress -O composer-setup.php https://getcomposer.org/installer
    php composer-setup.php
    sudo mv composer.phar /usr/local/bin/composer
else
    composer self-update
fi

