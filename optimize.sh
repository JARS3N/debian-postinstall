#!/bin/bash
# Clean up
sudo apt autoremove -y
sudo apt clean

# Disable animations for snappier performance
xfconf-query -c xfwm4 -p /general/use_compositing -s false

# Enable Plank on startup
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/plank.desktop
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Plank
EOF

echo "Optimization complete."
