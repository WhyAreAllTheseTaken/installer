#!/usr/bin/bash
set -e

sudo apt install linux-headers-`uname -r` adb gcc make

rm -rfv droidcam
mkdir droidcam
cd droidcam

wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_2.1.1.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam
sudo ./install-video
sudo ./install-client
cd ..
cd ..
