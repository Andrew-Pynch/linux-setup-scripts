brew install koekeishiya/formulae/yabai

brew services start yabai

cp ./yabairc ~/.yabairc

chmod +x ~/.yabairc

# Disable animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Accelerated playback when adjusting the window size.
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

brew services restart yabai

brew install koekeishiya/formulae/skhd
brew services start skhd

brew install cmacrae/formulae/spacebar

brew services start spacebar 

brew install homebrew/cask-fonts/font-fontawesome

mkdir ~/.config/spacebar
cp ./spacebarrc ~/.config/spacebar/
chmod +x ~/.config/spacebar/spacebarrc

brew services restart spacebar
