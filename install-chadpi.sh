#!/bin/bash
echo "Installer V0.2"
# Clone the ChadPi repository from GitHub into the user's home directory
git clone https://github.com/PythonScratcher/ChadPi.git ~/chadpi

# Create a symbolic link to the main script for easy execution
sudo cat << EOF > /usr/bin/chadpi
python3 ~/chadpi/main.py
EOF

# Create a .desktop file for ChadPi in the applications directory
cat << EOF > ~/.local/share/applications/chadpi.desktop
[Desktop Entry]
Type=Application
Name=ChadPi
Comment=Minecraft Pi: Reborn Launcher
Exec=python3 ~/chadpi/main.py
Icon=~/chadpi/assets/icon.png
Terminal=false
Categories=Games;
EOF

# Update the applications list
update-desktop-database ~/.local/share/applications/

echo "ChadPi has been installed! You can now execute it by typing 'chadpi' in the command line or searching for 'ChadPi' in the applications menu."
