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

## Setup CLI
./install_nvim.sh
./copy_cli_dotfiles.sh

arch=$(uname -m)

if [[ $arch == "x86_64" || $arch == "x64" ]]; then
    echo "Detected amd64";
    
    ./install_java_amd64.sh
elif [[ $arch == "aarch64" || $arch = "arm64" ]]; then
    echo "Detected aarch64";

    ./install_java_arm.sh
else
    echo "Unknown CPU architecture: $arch.";
fi

# Update rust
rustup update

# Update haskell
ghcup upgrade

# Install Prolog
sudo apt install -y swi-prolog

