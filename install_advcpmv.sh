#!/usr/bin/bash
set -e

curl https://raw.githubusercontent.com/jarun/advcpmv/master/install.sh --create-dirs -o ./advcpmv/install.sh && (cd advcpmv && sh install.sh)

sudo cp ./advcpmv/advcp /usr/local/bin/cpg
sudo cp ./advcpmv/advmv /usr/local/bin/mvg

