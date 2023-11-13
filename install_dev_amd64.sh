#!/usr/bin/bash
set -e

./install_java_amd64.sh

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Haskell
sudo apt install -y libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
set BOOTSTRAP_HASKELL_NONINTERACTIVE=1
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install Prolog
sudo apt install -y swi-prolog

mkdir -p ~/dev
mkdir -p ~/server

