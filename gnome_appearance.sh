#!/bin/bash
git clone https://github.com/kimlulz/Mkos-Big-Sur.git
cd Mkos-Big-Sur
mv Mkos-Big-Sur /home/$USER/.local/share/icons
cd /home/$USER
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh
echo "### GDM"
./install.sh -g -c light
echo "### nautilus sidebar size"
./install.sh -s 280
echo "### dock"
cd src/other/dash-to-dock
./install.sh -d
echo "### Change Setting - Appearance and Extention(dash-to-dock -> Appearance -> Turn on Use built-in theme)"
gnome-tweaks
echo "Finished.."