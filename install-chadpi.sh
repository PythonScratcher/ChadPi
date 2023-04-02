#!/bin/bash

# Prompt for username
read -p "Enter username to install ChadPi: " username

# Check if username exists
if [ ! -d "/home/$username" ]
  then echo "User $username does not exist"
  exit
fi

# Install required packages
apt install python3 python3-pip -y
pip install pyqt5
pip install pyqtdarktheme
pip install pypresence
pip install pillow
pip install qtwidgets
pip install darkdetect

# Clone the ChadPi repository from GitHub into the user's home directory
git clone https://github.com/PythonScratcher/ChadPi.git /home/$username/chadpi

# Set ownership and permission of chadpi directory
chown -R $username:$username /home/$username/chadpi
chmod -R 755 /home/$username/chadpi

# Create a symbolic link to the main script for easy execution
ln -s /home/$username/chadpi/main.py /usr/bin/chadpi

# Create a .desktop file for ChadPi in the applications directory
cat << EOF > /home/'$username'/.local/share/applications/chadpi.desktop
[Desktop Entry]
Type=Application
Name=ChadPi
Comment=Minecraft Pi: Reborn Launcher
Exec=python3 /home/'$username'/chadpi/main.py
Icon=/home/'$username'/chadpi/assets/icon.png
Terminal=false
Categories=Games;
EOF

# Update the applications list
update-desktop-database /home/$username/.local/share/applications/

echo "ChadPi has been installed for user $username! You can now execute it by typing 'chadpi' in the command line or searching for 'ChadPi' in the applications menu."
