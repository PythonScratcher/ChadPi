#!/bin/bash
echo "Installer V0.5"

# Prompt the user for the username to install ChadPi for
read -p "Enter the username to install ChadPi for: " username

# Clone the ChadPi repository from GitHub into the user's home directory
git clone https://github.com/PythonScratcher/ChadPi.git /home/$username/chadpi

# Create a symbolic link to the main script for easy execution
sudo bash -c 'cat << EOF > /usr/bin/chadpi
python3 /home/'$username'/chadpi/main.py
EOF'

# Create a .desktop file for ChadPi in the applications directory
cat << EOF > /home/$username/.local/share/applications/chadpi.desktop
[Desktop Entry]
Type=Application
Name=ChadPi
Comment=Minecraft Pi: Reborn Launcher
Exec=python3 /home/$username/chadpi/main.py
Icon=/home/$username/chadpi/assets/icon.png
Terminal=false
Categories=Games;
EOF

# Update the applications list
update-desktop-database /home/$username/.local/share/applications/

echo "ChadPi has been installed for user $username! You can now execute it by typing 'chadpi' in the command line or searching for 'ChadPi' in the applications menu."
