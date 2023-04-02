#!/bin/bash

# Clone the ChadPi repository from GitHub into the user's home directory
git clone https://github.com/PythonScratcher/ChadPi.git ~/chadpi

# Create a symbolic link to the main script for easy execution
ln -s ~/chadpi/main.py /bin/chadpi

# Add the ~/bin directory to the user's PATH environment variable
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# Source the ~/.bashrc file to apply the PATH changes
source ~/.bashrc

# Create a .desktop file for ChadPi in the applications directory
cat << EOF > ~/.local/share/applications/chadpi.desktop
[Desktop Entry]
Type=Application
Name=ChadPi
Comment=A Python script for ...
Exec=python3 ~/chadpi/main.py
Icon=~/chadpi/assets/icon512.png
Terminal=false
Categories=Utility;
EOF

# Update the applications list
update-desktop-database ~/.local/share/applications/

echo "ChadPi has been installed! You can now execute it by typing 'chadpi' in the command line or searching for 'ChadPi' in the applications menu."
