#!/usr/bin/bash
set -e

wget --show-progress -O vivaldi.deb https://downloads.vivaldi.com/stable/vivaldi-stable_6.1.3035.84-1_amd64.deb
wget --show-progress -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
wget --show-progress -O bluemail.deb https://download.bluemail.me/BlueMail/deb/BlueMail.deb
wget --show-progress -O steam.deb https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
wget --show-progress -O balena.deb https://github.com/balena-io/etcher/releases/download/v1.18.8/balena-etcher_1.18.8_amd64.deb
wget --show-progress -O obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.5/obsidian_1.3.5_amd64.deb
wget --show-progress -O onlyoffice.deb https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb

sudo dpkg --add-architecture i686
sudo apt update
sudo apt install -y lib32stdc++6 ./vivaldi.deb ./discord.deb ./bluemail.deb ./steam.deb ./balena.deb ./obsidian.deb gimp inkscape chromium filezilla ./onlyoffice.deb
sudo apt install -y virt-manager

