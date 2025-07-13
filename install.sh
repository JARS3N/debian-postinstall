#!/bin/bash
# Install base packages and XFCE desktop
sudo apt update && sudo apt upgrade -y
sudo apt install -y xfce4 xfce4-goodies plank synaptic gnome-disk-utility neofetch htop git curl

# Optional: Install your preferred browser, terminal, etc.
# sudo apt install -y firefox

# Run optimization after install
bash optimize.sh
