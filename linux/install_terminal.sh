# Fail on any command.
set -eux pipefail

sudo rm -rf ~/.oh-my-zsh
sudo rm -rf ~/.zshrc

# Install ZSH
sudo apt install -y git-core zsh curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
