#!/usr/bin/bash
set -e

# Install java
wget --show-progress -O openjdk-20.0.1.tar.gz https://download.java.net/java/GA/jdk20.0.1/b4887098932d415489976708ad6d1a4b/9/GPL/openjdk-20.0.1_linux-x64_bin.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar -xvzf openjdk-20.0.1.tar.gz --directory /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-20.0.1/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-20.0.1/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk-20.0.1/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk-20.0.1/bin/javac
update-alternatives --list java
update-alternatives --list javac

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

