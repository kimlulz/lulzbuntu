#!/bin/bash
sudo apt install -y gnome-tweaks
git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock
make
make install
cd ..
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh
./install.sh -c dark -c light -s 280
./tweaks.sh -d -c dark
sudo ./tweaks.sh -g
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh
echo "https://extensions.gnome.org/extension/2/move-clock/"
echo "https://extensions.gnome.org/extension/19/user-themes/"
