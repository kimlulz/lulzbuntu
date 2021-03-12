# lulzbuntu
Just script for configure my ubuntu desktop environment.  
To execute, `chmod +x lulzbuntu.sh` `sudo ./lulzbuntu.sh`

## lulzbuntu.sh
### Change APT Server
`sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list`

### Update APT Packages
`sudo apt update`  
`sudo apt upgrade -y`  
`sudo apt dist-upgrade`

### Install Basic Packages
`sudo add-apt-repository ppa:dawidd0811/neofetch`   
`sudo add-apt-repository ppa:git-core/ppa`   
`sudo apt update`   
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

### Remove unused Packages
`sudo apt purge firefox thunderbird`   
`sudo apt autoremove -y`

## OPTIONAL
### Add Neofetch to .bashrc
`echo "echo 'neofetch' >> /$HOME/.bashrc"`
