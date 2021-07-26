# lulzbuntu
Shell script for configure my ubuntu desktop environment.  
`LTS 20.04.2`   
To execute, `sh [script].sh`

In case of error while using script (Ex. `oh no something has gone wrong`),   
CTRL+ALT+F4 to open tty virtual console -> login -> `sudo dpkg --configure -a` -> `reboot` -> `sudo sh lulzbuntu.sh`   
or just reboot to recovery mode via grub menu -> select dpkg -> reboot   


## lulzbuntu.sh
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`
### Update distro and APTs
### Install Packages
`Add APT Repository` git-core/ppa
`Install` neofetch, build-essential, curl, gnome-tweaks, make, git, htop, wget, curl
`Install` Whale Browser (Based on Chromium), VSCode, VMware Player, Spotify    
`Clean` firefox, thunderbird and unused packages(via apt autoremove), `VMware-Player-16.1.0-17198959.x86_64.bundle`   
  
### Customize .bashrc
```
PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'
neofetch
```
![스크린샷, 2021-05-17 18-48-11](https://user-images.githubusercontent.com/42508318/118469207-75f96280-b740-11eb-84fa-936fe663bd49.png)


## zsh_install.sh
![스크린샷, 2021-07-26 18-09-18](https://user-images.githubusercontent.com/42508318/126964121-601118aa-2ab1-4cee-b71e-255a076b3dbe.png)
install zsh and oh-my-zsh(powerlevel10k), MesloLGS NF
Include `install` git, wget, fast-syntax-highlighting, zsh-autosuggestions

## gnome_appearance.sh
Install gnome-tweaks, Dash to dock, whitesur
Should install some extentions manually.. (will show urls of extentions)

## PsCC-Linux.sh
Install Photoshop CC for Linux   
Photoshop CC v19 installer for Linux  By  Gictorbit
https://github.com/Gictorbit/photoshopCClinux

script include install wine, winetrick   

## ibus_KRKEY_Fix.sh
Fix 한영(KR/EN) Key function for iBus   
set default kr106 to kr104
