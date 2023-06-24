#!/usr/bin/bash
set -e

wget --show-progress -O vivaldi.deb https://downloads.vivaldi.com/stable/vivaldi-stable_6.1.3035.100-1_arm64.deb

sudo dpkg --add-architecture i686
sudo apt update
sudo apt install -y lib32stdc++6 ./vivaldi.deb gimp inkscape chromium filezilla

