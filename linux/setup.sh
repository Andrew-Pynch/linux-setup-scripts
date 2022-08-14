AnacondaSetup() {
    if [ $# -eq 0 ]
    then
        if [$1 == '-a']
        then 
            echo "Downloading anaconda..."
            cd Downloads
            wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
            cd ~/Downloads 
            chmod +x Anaconda3-2020.02-Linux-x86_64.sh
            ./Anaconda3-2020.02-Linux-x86_64.sh
        else
            echo "Proceeding without Anaconda installation"
        fi
    else
        echo "No arguements supplied"
    fi
}

AnacondaSetup

./vimSetup.sh



# Other programs
sudo snap install --classic code
sudo apt install git
sudo snap install discord
git config --global user.email "andrewpynchbusiness@gmail.com"
git config --global user.name "Andrew Pynch"
sudo apt install neofetch
sudo apt install toilet
sudo apt install cowsay
sudo apt install nemo # file explorer 
# Install Brave Browser 
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

# Set some custom linux settings
xset r rate 280 70 # 280ms delay, 70 key repeats / sec

echo "To setup git with your creds sign in and... git config --global credential.helper store"

cd ~/Github/linux-setup-scripts

sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /snap/bin/chromium 200

xdg-open https://forums.fast.ai/t/jeremys-harebrained-install-guide/43814
xdg-open https://gist.github.com/jph00/0762f8d49c807b608f6efd69d6862bee

cp .bashrc ~/.bashrc -f
src ~/.bashrc



