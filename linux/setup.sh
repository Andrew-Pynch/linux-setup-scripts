#!/bin/bash
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%\n"

}
# This accounts as the "totalState" variable for the ProgressBar function
number=0
_end=100



# STARTUP
echo '=== BEGINNING SYSTEM CONFIGURATION ==='
ProgressBar ${number} ${_end}

number=10
ProgressBar ${number} ${_end}


# update && upgrade
echo y | sudo apt update 
echo y | sudo apt upgrade 


# apt-get
echo y | sudo apt-get install suckless-tools
echo y | sudo apt-get install arandr
echo y | sudo apt-get install dbus-x11
echo y | sudo apt-get install gdebi-core
echo y | sudo apt install nemo
echo y | sudo apt install git-core 
echo y | sudo apt install ratbagd
echo y | sudo apt install zsh curl
echo y | sudo apt install subversion
echo y | sudo apt install pzip-full
echo y | sudo apt install zsh
echo y | sudo apt install libfuse2
echo y | sudo apt install git -qq
echo y | sudo apt install neofetch -qq
echo y | sudo apt install i3-wm

number=20
ProgressBar ${number} ${_end}


# Snapplications ;-)
echo y | sudo snap install nvim --classic 
echo y | sudo snap install code --classic 
echo y | sudo snap install slack --channel=insider/edge
echo y | sudo snap install discord
echo y | sudo snap install brave 
echo y | sudo snap install gh

number=30
ProgressBar ${number} ${_end}


# Functions
ConfigureShTools() {
    echo y | curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo y | LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

    # Install packer for nvim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

ConfigurePythonTools() {
    pip install jupyter
}

ConfigureNvim() {
    filename=nvim.appimage
    if [[ -f "$filename" ]];
    then
        echo "$filename is already installed."
    else
        wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        sudo chmod +x nvim.appimage
        echo "$filename has not been found"
    fi
}

ConfigureGithub() {
	echo "Setting up github credentials..."
	git config --global user.email "andrewpynchbusiness@gmail.com"
	git config --global user.name  "Andrew Pynch"

    # Install github desktop
    sudo wget https://github.com/shiftkey/desktop/releases/download/release-3.1.1-linux1/GitHubDesktop-linux-3.1.1-linux1.deb
    echo y | sudo gdebi GitHubDesktop-linux-3.1.1-linux1.deb
}

ConfigureI3() {
    mkdir /home/andrew/.config/i3
    sudo cp configs/i3config /home/andrew/.config/i3/config

    cd ~/ && git clone https://github.com/tobi-wan-kenobi/bumblebee-status
}


CleanupTerminalConfig() {
    echo "CLEANING UP PREVIOUS TERMINAL CONFIGURATION"
    rm -rf .zshrc && rm -rf ~/.oh-my-zsh/ 
}

ConfigureTerminal() {
    CleanupTerminalConfig
    sudo sh install_powerline.sh
    sudo sh install_terminal.sh
    sudo sh install_profile.sh
}

ConfigureDockerCompose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
    sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
    sudo chmod +x /usr/bin/docker-compose
}


ConfigureTerminal
ConfigureShTools
ConfigureNvim
ConfigureGithub
ConfigureDockerCompose


# number=100
# ProgressBar ${number} ${_end}
echo 'DONE'
