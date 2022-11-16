#!/bin/bash
BL=$(tput bold)
NRM=$(tput sgr0)

function becho {
	>&2 echo -n "$BL$1$NRM"
}
mkdir ./tmp 

becho "1. Change Mirror Server"
    sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
echo ""

becho "2. Upgrade exist packages"
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade
echo ""

becho "3. Install Packages from repository"
    sudo apt update
    sudo apt install -y gnome-tweaks make cmake git wget curl htop pkg-config
echo ""

becho "4. Install Packages from external repo"
    becho "Git from ppa:git-core"
        sudo add-apt-repository ppa:git-core/ppa -y && sudo apt update && sudo apt install -y git && echo ""
    
    becho "Fastfetch.."
        cd ./tmp
        git clone https://github.com/LinusDierheimer/fastfetch
        cd fastfetch && mkdir -p build && cd build
        cmake .. && cmake --build . --target fastfetch --target flashfetch && cmake --install . --prefix /usr/local
        cd ../../  && mkdir -p ~/.fastfetch && echo ""
    
    becho "Visual Studio Code.."
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt update && sudo apt install -y code && echo ""
    
    becho "Browser.."
        becho "*************************************************"
        becho "(1) Google Chrome | Package | from google" 
        becho "(2) Ungoogled-Chrome | Build | from github"
        becho "(3) Naver Whale | Package | from naver"
        becho "(*) Firefox | Default"
        becho "*************************************************"
        becho "[1/2/3/[none]] > " ; read BRWS
        
        if [ $BRWS = "1" ]; then
			wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo apt install ./google-chrome-stable_current_amd64.deb && sudo apt purge firefox* -y && echo ""
        elif [ $BRWS = "2" ]; then
            sudo apt install -y devscripts equivs
            git clone https://github.com/ungoogled-software/ungoogled-chromium-debian.git
            cd ungoogled-chromium-debian && git submodule update --init --recursive && debian/rules setup
            sudo mk-build-deps -i debian/control && rm ungoogled-chromium-build-deps_* && dpkg-buildpackage -b -uc
            sudo apt install ./ungoogled-chromium- && sudo apt purge firefox* devscripts equivs -y && cd .. && echo ""
        elif [ $BRWS = "3" ]; then
            sudo sh -c 'echo "deb [arch=amd64] http://repo.whale.naver.com/stable/deb stable main" >> /etc/apt/sources.list.d/naver-whale.list'
            wget -q -O - http://repo.whale.naver.com/stable/deb/public.gpg | sudo apt-key add -
            sudo apt update && sudo apt install -y naver-whale-stable && sudo apt purge firefox* -y && echo ""
        else
            echo "Using Firefox" && echo ""
        fi
    
    becho "Shell.."
        becho "*************"
        becho "(1) Zsh"
        becho "(2) Fish"
        becho "(*) Bash"
        becho "*************"
        becho "[1/2/[none]] > " ; read SHC
        
        if [ $SHC = "1" ]; then
            sudo apt install -y zsh && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && chsh -s /usr/bin/zsh
            mkdir ~/.local/share/fonts
            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts/
            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts/
            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts/
            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts/
            fc-cache -f -v
            curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
            wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/.zshrc && mv .zshrc ~/.zshrc
            wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/preset -P ~/.fastfetch && wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii -P ~/.fastfetch
            echo "fastfetch --load-config .fastfetch/preset -l ~/.fastfetch/pepe2.ascii" >> ~/.bashrc && echo "fastfetch --load-config .fastfetch/preset -l ~/.fastfetch/pepe2.ascii" >> ~/.zshrc && echo ""
        
        elif [ $SHC = "2" ]; then
            sudo apt-add-repository ppa:fish-shell/release-2 && sudo apt update && sudo apt install fish -y && chsh -s /usr/bin/fish
            curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish
            echo "Theme 'agnoster'" >> ~/.config/fish/config.fish && echo "Plugin 'theme'" >> ~/.config/fish/config.fish
            wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/preset -P ~/.fastfetch && wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii -P ~/.fastfetch
            omf install && omf theme agnoster && echo ""
        
        else
            wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/preset -P ~/.fastfetch && wget https://raw.githubusercontent.com/kimlulz/dotfiles/main/zsh/pepe2.ascii -P ~/.fastfetch
            echo "PS1='\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]|\[\e[0;1m\]$?\[\e[0m\]] \[\e[0;1;3;4m\]\w\[\e[0m\] \[\e[0;92m\]\$ \[\e[0m\]'" > ~/.bashrc && echo "fastfetch --load-config .fastfetch/preset -l ~/.fastfetch/pepe2.ascii" >> ~/.bashrc && echo ""
        fi
    
becho "5. Clean-up"
    cd ..
    sudo apt purge thunderbird* -y && sudo apt autoremove -y && rm -rf ./tmp
echo ""

becho "Finished"