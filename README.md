# lulzbuntu
Just script for configure my ubuntu desktop environment.  
To execute, `sudo ./lulzbuntu.sh`

## Script Include...
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`

### Update APT Packages
`sudo apt update`  
`sudo apt upgrade -y`  
`sudo apt dist-upgrade`

### Remove unused Packages
`sudo apt autoremove -y`

### Install Basic Packages
`sudo apt update`   
`sudo add-apt-repository ppa:dawidd0811/neofetch`   
`sudo apt install -y neofetch build-essential curl gdebi gnome-tweaks make git`   

### install whale_Browser
`wget https://installer-whale.pstatic.net/downloads/installers/naver-whale-stable_amd64.deb --no-check-certificate`   
`sudo dpkg -i naver-whale-stable_amd64.deb` 

### install vscode
`wget https://az764295.vo.msecnd.net/stable/f30a9b73e8ffc278e71575118b6bf568f04587c8/code_1.54.1-1614898113_amd64.deb --no-check-certificate`   
`sudo dpkg -i code_1.54.1-1614898113_amd64.deb` 

### install VMware Player
`wget https://download3.vmware.com/software/player/file/VMware-Player-16.1.0-17198959.x86_64.bundle --no-check-certificate`   
`sudo sh VMware-Player-16.1.0-17198959.x86_64.bundle` 

### Remove unused apps
`sudo apt purge firefox thunderbird`

## OPTIONAL
### Add Neofetch to .bashrc
`echo "echo 'neofetch' >> /$HOME/.bashrc"`
