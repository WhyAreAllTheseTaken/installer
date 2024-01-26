#!/usr/bin/bash
set -e

arch=$(uname -m)

sudo apt update
./requirements.sh
./get_dotfiles.sh

# Basic CLI tools
sudo apt install -y zsh nnn htop neofetch

# Download nnn plugins
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

# CLI apps
./install_advcpmv.sh
./install_nvim.sh

./copy_cli_dotfiles.sh

# Determine whether to install network manager.
if [[ $arch == "x86_64" || $arch == "x64" ]]; then
    echo "Detected amd64";

    wsl_detect_path="/proc/sys/fs/binfmt_misc/WSLInterop"
    if [[ -f "$wsl_detect_path" ]]; then 
        echo "Detected WSL running on amd64";

        echo "Skipping network manager install."
    else
        echo "Detected plain amd64";

        sudo apt install -y network-manager
    fi
else
    echo "Unknown CPU architecture: $arch.";
    
    sudo apt install -y network-manager
fi

if [[ "desktop" == $1 ]]; then
    echo "Installing desktop..."
    ./install_desktop.sh

    if [[ $arch == "x86_64" || $arch == "x64" ]]; then
        echo "Detected amd64";
        ./install_apps_amd64.sh
    elif [[ $arch == "aarch64" || $arch = "arm64" ]]; then
        echo "Detected aarch64";
        ./install_apps_arm.sh
    else
        echo "Unknown CPU architecture: $arch.";
    fi

    # ./install_aseprite.sh
    
    ./copy_gui_dotfiles.sh
fi

# Install LaTeX
sudo apt install -y texlive

sudo "Setting up development environment"
./install_dev.sh

echo "Changing shell"
chsh -s /usr/bin/zsh

# Boot Config
if [[ $arch == "x86_64" || $arch == "x64" ]]; then
    echo "Detected amd64";
    ./configure_grub.sh
else
    echo "Unknown CPU architecture: $arch.";
fi

