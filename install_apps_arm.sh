#!/usr/bin/bash
set -e

wget --show-progress -O vivaldi.deb https://downloads.vivaldi.com/stable/vivaldi-stable_6.1.3035.100-1_arm64.deb

sudo apt install -y ./vivaldi.deb gimp inkscape chromium filezilla

