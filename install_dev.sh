#!/usr/bin/bash
set -e

arch=$(uname -m)

# Setup java.
if [[ $arch == "x86_64" || $arch == "x64" ]]; then
    echo "Detected amd64";
    ./install_java_amd64.sh
elif [[ $arch == "aarch64" || $arch = "arm64" ]]; then
    echo "Detected aarch64";
    ./install_java_arm.sh
else
    echo "Unknown CPU architecture: $arch.";
fi

# Install python
sudo apt install -y python3 

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Haskell
sudo apt install -y libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
set BOOTSTRAP_HASKELL_NONINTERACTIVE=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install PHP
sudo apt install -y php-cli

if ! command -v composer
then 
    rm -fv composer-setup.php
    rm -fv composer.phar 
    wget --show-progress -O composer-setup.php https://getcomposer.org/installer
    php composer-setup.php
    sudo mv composer.phar /usr/local/bin/composer
fi

# Install languages through apt
sudo apt install -y swi-prolog ruby-full

mkdir -p ~/dev
mkdir -p ~/server

