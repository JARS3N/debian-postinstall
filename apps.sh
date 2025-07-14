#!/bin/bash

# Basic safety
set -e

# Update system
apt update && apt -y upgrade && apt -y dist-upgrade

# Core utilities and optimizations
apt install -y \
    curl wget git neofetch htop build-essential \
    cmake pkg-config python3 python3-pip python3-venv \
    unzip zip p7zip-full p7zip-rar rar unrar \
    fonts-roboto fonts-dejavu \
    xfce4 xfce4-goodies plank \
    lightdm lightdm-gtk-greeter \
    gnome-keyring seahorse \
    gvfs-backends policykit-1-gnome \
    xclip xsel vlc mpv \
    ranger mediainfo ffmpeg \
    gnome-disk-utility baobab \
    network-manager network-manager-gnome \
    xfce4-whiskermenu-plugin xfce4-dockbarx-plugin \
    galculator file-roller gparted \
    synaptic apt-transport-https ca-certificates \
    software-properties-common \
    firmware-linux firmware-linux-nonfree firmware-iwlwifi \
    exfat-fuse exfatprogs ntfs-3g

# Development tools and scientific stack
apt install -y \
    emacs r-base r-recommended \
    r-cran-tidyverse r-cran-data.table r-cran-ggplot2 \
    rstudio \
    libopenblas-dev liblapack-dev libfftw3-dev \
    libxml2-dev libcurl4-openssl-dev libssl-dev \
    clang gfortran \
    sqlite3 libsqlite3-dev \
    libreoffice gimp inkscape

# Clean XFCE setup: disable desktop icons
xfconf-query -c xfce4-desktop -p /desktop-icons/style -s 0 || true

# LightDM greeter tweaks (optional)
if [ -f /etc/lightdm/lightdm-gtk-greeter.conf ]; then
    sed -i 's/^#background=.*/background=/usr/share/backgrounds/xfce/xfce-blue.jpg/' /etc/lightdm/lightdm-gtk-greeter.conf
fi

# Enable NetworkManager
systemctl enable NetworkManager

# Enable LightDM
systemctl enable lightdm

# Done
echo "Setup complete. Reboot recommended."
