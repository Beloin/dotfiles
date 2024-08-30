#!/bin/bash

echo "Ubuntu i3 installation";

# Basic setup

echo "Installing basic setup";
sudo apt install -y i3 i3lock i3blocks lxpolkit nitrogen picom dmenu rofi maim pulseaudio-utils lxappearance git;

# Configuration files
echo "Installing configuration files";

# I3 and i3 blocks
curl -XGET "https://raw.githubusercontent.com/Beloin/dotfiles/main/i3/i3.config" > ~/Downloads/i3.config;
cp ~/.config/i3/config{,.bak};
cp ~/Downloads/i3.config ~/.config/i3/config;

curl -XGET "https://raw.githubusercontent.com/Beloin/dotfiles/main/i3/blocks/config" > ~/Downloads/i3blocks.config;
cp ~/.config/i3blocks/config{,.bak} 2> /dev/null || :;
cp ~/Downloads/i3blocks.config ~/.config/i3blocks/config;

echo "export SCRIPT_DIR=$HOME/.config/i3blocks/scripts" >> ~/.bashrc;
sed "s/set \$refresh_i3status killall -SIGUSR1 i3status/set \$refresh_i3status pkill -RTMIN+1 i3blocks" ~/.config/i3/config > ~/.config/i3/config;
sed "s/i3status/i3blocks" ~/.config/i3/config > ~/.config/i3/config; 
