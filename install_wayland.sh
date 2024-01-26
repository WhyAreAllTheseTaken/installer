#!/usr/bin/bash
set -e

sudo apt install -y rofi materia-gtk-theme pavucontrol hicolor-icon-theme kitty fonts-noto libgtk-3-dev pasystray network-manager-gnome lxpolkit cava

# Install i3blocks
rm -rfv ./i3blocks-contrib
git clone https://github.com/vivien/i3blocks-contrib.git
cd i3blocks-contrib
rm -rfv ~/.config/i3blocks
mkdir -p ~/.config/i3blocks
cp -rv ./. ~/.config/i3blocks
cd ..

# Install Icons
rm -rfv ./Wings-Plasma-Themes
git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.git
sudo cp -rv ./Wings-Plasma-Themes/Wings\ Icons\ Themes/* /usr/share/icons/

# Install swaylock-effects
sudo apt install meson wayland wayland-protocols libxkbcommon cairo gdk-pixbuf2 scdoc git
rm -rfv swaylock-effects
git clone --depth 1 https://github.com/mortie/swaylock-effects/
cd swaylock-effects
meson build
ninja -C build
sudo ninja -C build install
cd ..

# Drag and drop support
rm -rfv dragon
git clone --depth 1 https://github.com/mwh/dragon
cd dragon
sudo make PREFIX="/usr/bin" install
cd ..

sudo mkdir -p /usr/share/backgrounds
sudo cp -v ./bg1440.png /usr/share/backgrounds

