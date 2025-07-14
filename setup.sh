#!/bin/bash

# Set DEBIAN_FRONTEND to noninteractive to prevent prompts
export DEBIAN_FRONTEND=noninteractive

# Update and upgrade base system
apt update && apt -y upgrade && apt -y dist-upgrade

# Base CLI utilities
apt install -y \
    curl wget git htop neofetch lsof psmisc unzip zip \
    bash-completion build-essential software-properties-common \
    aptitude rsync xclip xsel entr ripgrep fd-find fzf \
    tree ranger net-tools iputils-ping dnsutils \
    jq moreutils tmux

# Networking tools
apt install -y nmap iperf3 traceroute

# XFCE environment utilities
apt install -y \
    xfce4 xfce4-goodies \
    lightdm slick-greeter \
    plank \
    xfce4-whiskermenu-plugin \
    fonts-firacode fonts-roboto fonts-noto-color-emoji

    
echo "Setting Plank to autostart..."
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/plank.desktop
[Desktop Entry]
Type=Application
Name=Plank Dock
Exec=plank
X-GNOME-Autostart-enabled=true
EOF

echo "Removing XFCE panel to avoid double dock..."
xfconf-query -c xfce4-panel -p /panels -n -t int -s 0 || true
pkill xfce4-panel || true


# Media tools
apt install -y \
    vlc mpv ffmpeg gimp inkscape \
    flameshot audacity obs-studio

# Browser
apt install -y firefox-esr

# Development tools
apt install -y \
    build-essential gcc g++ make cmake \
    python3 python3-pip python3-venv \
    golang nodejs npm \
    default-jdk openjdk-17-jdk maven gradle \
    clang clang-format clang-tidy lldb

# Scientific Python stack
apt install -y \
    python3-numpy python3-scipy python3-pandas python3-matplotlib \
    python3-seaborn python3-sklearn python3-statsmodels \
    python3-jupyter-notebook

# LaTeX
apt install -y texlive texlive-latex-extra texlive-science texlive-fonts-extra pandoc

# Document and PDF tools
apt install -y \
    libreoffice evince zathura zathura-pdf-poppler

# Virtualization
apt install -y qemu qemu-kvm libvirt-daemon-system libvirt-clients virt-manager

# Flatpak support
apt install -y flatpak gnome-software-plugin-flatpak

# Multimedia codecs
apt install -y ubuntu-restricted-extras gstreamer1.0-libav gstreamer1.0-plugins-bad

# System cleanup utilities
apt install -y bleachbit ncdu

# Audio utilities
apt install -y pavucontrol pulseaudio alsa-utils

# Cleaning up
apt autoremove -y && apt clean && updatedb

# Enable LightDM service
systemctl enable lightdm.service

# End of script
echo "System setup complete. Reboot recommended."
