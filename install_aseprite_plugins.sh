#!/usr/bin/bash
set -e

rm -rfv AsepriteOkHsl

git clone --depth 1 https://github.com/behreajj/AsepriteOkHsl.git
mkdir -p ~/.config/aseprite/scripts
cp -rv AsepriteOkHsl/* ~/.config/aseprite/scripts/

