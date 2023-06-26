#!/usr/bin/bash
set -e

lspci -nn | egrep -i "3d|display|vga"
sudo apt install nvidia-detect
nvidia-detect
