#!/usr/bin/bash
set -e

# Updated packages
sudo apt update
sudo apt list --upgradeable
sudo apt upgrade

# Get latest dot files
./get_dotfiles.sh
./update_cli.sh

# Install latest java
./install_java.sh

# Update rust
rustup update

# Update haskell
ghcup upgrade

