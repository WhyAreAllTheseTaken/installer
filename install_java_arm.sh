#!/usr/bin/bash
set -e

# Install java
wget --show-progress -O openjdk-21.0.1.tar.gz https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_linux-aarch64_bin.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar -xvzf openjdk-21.0.1.tar.gz --directory /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-21.0.1/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-21.0.1/bin/javac" 0
sudo update-alternatives --install "/usr/bin/jlink" "jlink" "/usr/lib/jvm/jdk-21.0.1/bin/jlink" 0
sudo update-alternatives --install "/usr/bin/jshell" "jshell" "/usr/lib/jvm/jdk-21.0.1/bin/jshell" 0
sudo update-alternatives --install "/usr/bin/javap" "javap" "/usr/lib/jvm/jdk-21.0.1/bin/javap" 0
sudo update-alternatives --install "/usr/bin/javadoc" "javadoc" "/usr/lib/jvm/jdk-21.0.1/bin/javadoc" 0
sudo update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/jdk-21.0.1/bin/jar" 0
sudo update-alternatives --install "/usr/bin/jmod" "jmod" "/usr/lib/jvm/jdk-21.0.1/bin/jmod" 0
sudo update-alternatives --install "/usr/bin/jdeps" "jdeps" "/usr/lib/jvm/jdk-21.0.1/bin/jdeps" 0
sudo update-alternatives --install "/usr/bin/jdeprscan" "jdeprscan" "/usr/lib/jvm/jdk-21.0.1/bin/jdeprscan" 0
sudo update-alternatives --install "/usr/bin/jarsigner" "jarsigner" "/usr/lib/jvm/jdk-21.0.1/bin/jarsigner" 0
sudo update-alternatives --install "/usr/bin/keytool" "keytool" "/usr/lib/jvm/jdk-21.0.1/bin/keytool" 0
sudo update-alternatives --install "/usr/bin/jconsole" "jconsole" "/usr/lib/jvm/jdk-21.0.1/bin/jconsole" 0
sudo update-alternatives --install "/usr/bin/jdb" "jdb" "/usr/lib/jvm/jdk-21.0.1/bin/jdp" 0
sudo update-alternatives --install "/usr/bin/jcmd" "jcmd" "/usr/lib/jvm/jdk-21.0.1/bin/jcmd" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk-21.0.1/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk-21.0.1/bin/javac
sudo update-alternatives --set jlink /usr/lib/jvm/jdk-21.0.1/bin/jlink
sudo update-alternatives --set jshell /usr/lib/jvm/jdk-21.0.1/bin/jshell
sudo update-alternatives --set javap /usr/lib/jvm/jdk-21.0.1/bin/javap
sudo update-alternatives --set javadoc /usr/lib/jvm/jdk-21.0.1/bin/javadoc
sudo update-alternatives --set jar /usr/lib/jvm/jdk-21.0.1/bin/jar
sudo update-alternatives --set jmod /usr/lib/jvm/jdk-21.0.1/bin/jmod
sudo update-alternatives --set jdeps /usr/lib/jvm/jdk-21.0.1/bin/jdeps
sudo update-alternatives --set jdeprscan /usr/lib/jvm/jdk-21.0.1/bin/jdeprscan
sudo update-alternatives --set jarsigner /usr/lib/jvm/jdk-21.0.1/bin/jdeprscan
sudo update-alternatives --set keytool /usr/lib/jvm/jdk-21.0.1/bin/keytool
sudo update-alternatives --set jconsole /usr/lib/jvm/jdk-21.0.1/bin/jconsole
sudo update-alternatives --set jdb /usr/lib/jvm/jdk-21.0.1/bin/jdb
sudo update-alternatives --set jcmd /usr/lib/jvm/jdk-21.0.1/bin/jcmd
update-alternatives --list java
update-alternatives --list javac
update-alternatives --list jshell
update-alternatives --list jlink
update-alternatives --list javap
update-alternatives --list javadoc
update-alternatives --list jar
update-alternatives --list jmod
update-alternatives --list jdeps
update-alternatives --list jdeprscan
update-alternatives --list jarsigner
update-alternatives --list keytool
update-alternatives --list jconsole
update-alternatives --list jdb
update-alternatives --list jcmd

