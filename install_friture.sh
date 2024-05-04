#!/usr/bin/bash
set -e

rm -rfv friture
sudo rm -rfv /usr/local/share/friture

sudo apt install git libportaudio2 python3.11-dev virtualenv
git clone --depth 1 https://github.com/tlecomte/friture.git
sudo cp -rv ./friture /usr/local/share/

sudo /usr/bin/bash -c 'cd /usr/local/share/friture;
virtualenv -p /usr/bin/python3.11 buildenv;
source ./buildenv/bin/activate;
pip3.11 install -r requirements.txt;
python3.11 setup.py build_ext --inplace'

sudo cp ./friture.sh /usr/local/bin/friture

