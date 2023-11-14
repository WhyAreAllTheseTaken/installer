#!/usr/bin/bash
set -e

# Install java
wget --show-progress -O openjdk-21.0.1.tar.gz https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_linux-aarch64_bin.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar -xvzf openjdk-21.0.1.tar.gz --directory /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-21.0.1/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-21.0.1/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk-21.0.1/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk-21.0.1/bin/javac
update-alternatives --list java
update-alternatives --list javac

