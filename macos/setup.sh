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

# Install Homebrew if it's not installed
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

number=20
ProgressBar ${number} ${_end}

# Install necessary tools using brew
brew install git neofetch zsh curl wget

number=30
ProgressBar ${number} ${_end}

# Install applications using brew cask
brew install --cask visual-studio-code slack discord brave-browser github

number=40
ProgressBar ${number} ${_end}

# Functions
ConfigureShTools() {
    # ... Rest of the ConfigureShTools code ...
}

ConfigurePythonTools() {
    pip install jupyter
}

ConfigureNvim() {
    # ... Rest of the ConfigureNvim code ...
}

ConfigureGithub() {
    echo "Setting up github credentials..."
    git config --global user.email "andrewpynchbusiness@gmail.com"
    git config --global user.name  "Andrew Pynch"
}


CleanupTerminalConfig() {
    echo "CLEANING UP PREVIOUS TERMINAL CONFIGURATION"
    rm -rf .zshrc && rm -rf ~/.oh-my-zsh/ 
}

ConfigureTerminal() {
    CleanupTerminalConfig
    # ... Rest of the ConfigureTerminal code ...
}

ConfigureDockerCompose() {
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
    sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
    sudo chmod +x /usr/bin/docker-compose
}

# Function calls
ConfigureTerminal
ConfigureShTools
ConfigureNvim
ConfigureGithub
ConfigureDockerCompose

number=100
ProgressBar ${number} ${_end}

echo 'DONE'


sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
