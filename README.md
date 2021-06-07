# lulzbuntu
Shell script for configure my ubuntu desktop environment.  
To execute, `sh [script].sh`

In case of error while using script (Ex. `oh no something has gone wrong`),   
CTRL+ALT+F4 to open tty virtual console -> login -> `sudo dpkg --configure -a` -> `reboot` -> `sudo sh lulzbuntu.sh`   
or just reboot to recovery mode via grub menu -> select dpkg -> reboot   


## lulzbuntu.sh
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`
### Update distro and APTs
### Install Packages
Add APT Repository ppa:dawidd0811/neofetch, ppa:git-core/ppa   
Use Curl https://deb.nodesource.com/setup_15.x to get node.js v.15 (Official repo has an old version of nodejs..)   
Install neofetch, nodejs, build-essential, libva-dev, vainfo, curl, gdebi, gnome-tweaks, make, git, htop  
Install Whale Browser (Based on Chromium), VSCode, VMware Player, balenaEtcher, Spotify    
Remove firefox, thunderbird and unused packages(apt autoremove)    
Remove downloaded files (VMware Player)    
  
### Customize .bashrc
```
PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
neofetch
```
![스크린샷, 2021-05-17 18-48-11](https://user-images.githubusercontent.com/42508318/118469207-75f96280-b740-11eb-84fa-936fe663bd49.png)
## lts_to_major.sh
Change LTS to Non-LTS.

## zsh_install.sh
![스크린샷, 2021-05-20 02-38-11](https://user-images.githubusercontent.com/42508318/118858803-7fd3bf00-b914-11eb-8471-d3ad4a712f81.png)    
WIP
DO NOT USE

## gnome_appearance.sh
Install gnome-tweaks, Dash to dock, whitesur
Should install some extentions manually.. (will show urls of extentions)

## PsCC-Linux.sh
Install Photoshop CC for Linux
Photoshop CC v19 installer for Linux  By  Gictorbit
https://github.com/Gictorbit/photoshopCClinux

script include install wine, winetrick

-- ## hoffice_install.sh --
이거 만들어서 깃허브에 올렸던 놈이 빤쓰런함


## ibus_KRKEY_Fix.sh
Fix 한영(KR/EN) Key function for iBus
set default kr106 to kr104
