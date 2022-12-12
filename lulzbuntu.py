#!/usr/bin/env python

#TEST
#221212

#import
import subprocess
import os

#Block Non-root user
if os.geteuid() != 0 or os.getuid() != 0:
    print("You must run this script with root permission")
    exit(1)

#subprocess
bold = subprocess.check_output(['tput', 'bold'])
nrm = subprocess.check_output(['tput', 'sgr0'])

def becho(text):
    print(f"\033[1m{text}\033[0m")

becho("Make temporary folder for Cleaning")
os.mkdir('./tmp')

# 1. Change Mirror Server
becho("1. Change Mirror Server")
subprocess.run(['sed', '-i', 's/kr.archive.ubuntu.com/mirror.kakao.com/g', '/etc/apt/sources.list'])
print("")

becho("2. Upgrade exist packages")
subprocess.run(['apt', 'update'])
subprocess.run(['apt', 'upgrade', '-y'])
subprocess.run(['apt', 'dist-upgrade'])
print("")

becho("3. Install Packages from repository")
subprocess.run(['apt', 'update'])
subprocess.run(['apt', 'install', '-y', 'gnome-tweaks', 'make', 'cmake', 'git', 'wget', 'curl', 'htop', 'pkg-config'])
print("")

becho("4. Install Packages from external repo")
becho("Git from ppa:git-core")
subprocess.run(["sudo", "add-apt-repository", "ppa:git-core/ppa", "-y"])
subprocess.run(["sudo", "apt", "update"])
subprocess.run(["sudo", "apt", "install", "-y", "git"])
print("")

becho("Visual Studio Code..")
subprocess.run(["wget", "-qO-", "https://packages.microsoft.com/keys/microsoft.asc", "|", "gpg", "--dearmor", ">", "packages.microsoft.gpg"])
subprocess.run(["sudo", "install", "-o", "root", "-g", "root", "-m", "644", "packages.microsoft.gpg", "/etc/apt/trusted.gpg.d/"])
subprocess.run(["sudo", "sh", "-c", 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'])
subprocess.run(["sudo", "apt", "update"])
subprocess.run(["sudo", "apt", "install", "-y", "code"])
print("")

becho("Hyper Terminal..")
import urllib.request
subprocess.run(["wget", "https://releases.hyper.is/download/deb", "-O", "hyper.deb"])
subprocess.run(["sudo", "apt", "install", "./hyper.deb"])
subprocess.run(["hyper"])
subprocess.run(["sleep", "3"])
subprocess.run(["killall", "hyper"])
subprocess.run(["sed", "-i", "s/fontFamily: '/fontFamily : 'MesloLGS NF, /g", "~/.hyper.js"])
subprocess.run(["mkdir", "~/.local/share/fonts"])
urllib.request.urlretrieve("https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf", "~/.local/share/fonts/")
urllib.request.urlretrieve("https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf", "~/.local/share/fonts/")
urllib.request.urlretrieve("https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf", "~/.local/share/fonts/")
urllib.request.urlretrieve("https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf", "~/.local/share/fonts/")
subprocess.run(["fc-cache", "-f", "-v"])

becho("Browser..")
becho("*************************************************")
becho("(1) Google Chrome | Package | from google")
becho("(2) Ungoogled-Chrome | Build | from github")
becho("(3) Naver Whale | Package | from naver")
becho("(*) Firefox | Default")
becho("*************************************************")

# Get the user's input
BRWS = input("[1/2/3/[none]] > ")

if BRWS == "1":
    # Download and install Google Chrome
    subprocess.run(["wget", "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"])
    subprocess.run(["sudo", "apt", "install", "./google-chrome-stable_current_amd64.deb"])
    subprocess.run(["sudo", "apt", "purge", "firefox*", "-y"])
    print("")

elif BRWS == "2":
    # Install dependencies
    subprocess.run(["sudo", "apt", "install", "-y", "devscripts", "equivs"])
    # Clone the repository and build the package
    subprocess.run(["git", "clone", "https://github.com/ungoogled-software/ungoogled-chromium-debian.git"])
    subprocess.run(["cd", "ungoogled-chromium-debian"])
    subprocess.run(["git", "submodule", "update", "--init", "--recursive"])
    subprocess.run(["debian/rules", "setup"])
    subprocess.run(["sudo", "mk-build-deps", "-i", "debian/control"])
    subprocess.run(["rm", "ungoogled-chromium-build-deps_*"])
    subprocess.run(["dpkg-buildpackage", "-b", "-uc"])
    # Install the package and remove the dependencies
    subprocess.run(["sudo", "apt", "install", "./ungoogled-chromium-"])
    subprocess.run(["sudo", "apt", "purge", "firefox*", "devscripts", "equivs", "-y"])
    subprocess.run(["cd", ".."])
    print("")

elif BRWS == "3":
    # Install Naver Whale
    subprocess.run(['sudo', 'sh', '-c', 'echo "deb [arch=amd64] http://repo.whale.naver.com/stable/deb stable main" >> /etc/apt/sources.list.d/naver-whale.list'])
    subprocess.run(['wget', '-q', '-O', '-', 'http://repo.whale.naver.com/stable/deb/public.gpg'], stdout=subprocess.PIPE)
    subprocess.run(['sudo', 'apt', 'update'])
    subprocess.run(['sudo', 'apt', 'install', '-y', 'naver-whale-stable'])
    subprocess.run(['sudo', 'apt', 'purge', 'firefox*', '-y'])
    print("")

else:
    becho("Using Firefox")
    print("")

# WIP 4.Shell

becho("5. Clean-up")
subprocess.run(['cd', '..'])
subprocess.run(['sudo', 'apt', 'purge', 'thunderbird*', '-y'])
subprocess.run(['sudo', 'apt', 'autoremove', '-y'])
subprocess.run(['rm', '-rf', './tmp'])
print("")

becho("Finished")