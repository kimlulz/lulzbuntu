# lulzbuntu
Just script for configure my ubuntu desktop environment.  
To execute, `source [script].sh`

In case of error while using script (Ex. `oh no something has gone wrong`), reboot ->

recovery mode -> dpkg

or 

normal boot -> CTRL+ALT+F4 -> login -> `sudo dpkg --configure -a` -> `reboot` -> `./lulzbuntu.sh` 

## lulzbuntu.sh include
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`
### Update distro and APTs
### Install Packages
Add APT Repository ppa:dawidd0811/neofetch, ppa:git-core/ppa    

Use Curl https://deb.nodesource.com/setup_14.x to get node.js v.14 (Official repo has an old version of nodejs..)    

Install neofetch, nodejs, build-essential, curl, gdebi, gnome-tweaks, make, git    

Install Whale Browser (Based on Chromium), VSCode, VMware Player, balenaEtcher, Spotify    

Remove firefox, thunderbird, google-chrome-stable and unused packages(apt autoremove)    

Remove downloaded files (VSCode, VMware Player)    
  
### Add Neofetch to .bashrc
`echo 'neofetch' >> /home/$USERNAME/.bashrc` 

## gnome_appearance.sh include
Install Mkos-Big-Sur icons and WhiteSur themes    
Need install dash to dock

## PsCC-Linux.sh include
Install Photoshop CC for Linux
Photoshop CC v19 installer for Linux  By  Gictorbit
https://github.com/Gictorbit/photoshopCClinux

script include install wine, winetrick

## ibus_KRKEY_Fix.sh
Fix 한영(KR/EN) Key function for iBus
set default kr106 to kr104
