#!/usr/bin/bash
set -e

# Install java
sudo apt install -y unzip
rm -fv ltsatool.zip
rm -rfv ltsatool
wget --show-progress -O ltsatool.zip https://www.doc.ic.ac.uk/~jnm/book/ltsa/ltsatool.zip
unzip ltsatool.zip
sudo rm -rfv /usr/local/share/ltsatool
sudo cp -rv ./ltsatool /usr/local/share/
sudo cp ./ltsa /usr/local/bin/
sudo chmod +x /usr/local/bin/ltsa

