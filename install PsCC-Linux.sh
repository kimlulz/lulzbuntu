#!/bin/bash
echo "################################################################################"
echo "################################ GNU/PSCC Linux_ ################################"
echo "################################################################################"
echo "Photoshop CC v19 installer for Linux  By  Gictorbit"
echo "https://github.com/Gictorbit/photoshopCClinux"
echo "S C R I P T   B Y   K I M L U L Z"
echo "github.com/kimlulz/lulzbuntu${normal}"
echo "### Install Wine"
sudo apt update
sudo apt install -y wine64
echo "### Install Additional extras of Wine"
sudo apt install -y  winetricks mono-complete
wget http://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.tar.xz
tar -xvf wine-gecko-2.47.2-x86_64.tar.xz 
sudo mv wine-gecko-2.47.2-x86_64  /usr/share/wine/gecko
echo "### Download PsCC-Linux from Github"
git clone https://github.com/Gictorbit/photoshopCClinux.git
cd photoshopCClinux
chmod +x setup.sh
echo "### Start install"
./setup.sh
