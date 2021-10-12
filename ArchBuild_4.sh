#!/usr/bin/env bash

source ./config.sh

ADDRESS=$(pwd)

puts "Setting the sound card."
asoundconf set-default-card ${MYSOUNDCARD}

puts "Making directoriers in the user's Home directory."
mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/Pictures/Screenshots ~/Projects ~/Repositories ~/Junk ~/.aur ~/.config

puts "Cloning, building and installing yay."
cd ~/.aur
git clone https://aur.archlinux.org/yay.git/
cd yay
makepkg -si

cd $ADDRESS

puts "Setting up all the dotfiles."
! [ -d ~/.config/nvim ] && mkdir ~/.config/nvim
! [ -d ~/.config/gtk-3.0 ] && mkdir ~/.config/gtk-3.0
! [ -d ~/.config/alacritty ] && mkdir ~/.config/alacritty

cp -r dotfiles/i3 ~/.config/
cp -r dotfiles/rofi ~/.config/
cp -r dotfiles/dunst ~/.config/
cp -r dotfiles/polybar ~/.config/

cp dotfiles/bashrc ~/.bashrc
cp dotfiles/xinitrc ~/.xinitrc
cp dotfiles/octaverc ~/.octaverc
cp dotfiles/sqliterc ~/.sqliterc
cp dotfiles/Xresources ~/.Xresources
cp dotfiles/init.lua ~/.config/nvim/init.lua
cp dotfiles/mimeapps.list ~/.config/mimeapps.list
cp dotfiles/config_time.sh ~/.config/config_time.sh
cp dotfiles/screenkey.json ~/.config/screenkey.json
cp dotfiles/settings.ini ~/.config/gtk-3.0/settings.ini
cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
cp dotfiles/betterlockscreenrc ~/.config/betterlockscreenrc
cp dotfiles/toggle_screenkey.sh ~/.config/toggle_screenkey.sh

echo -e "\n# Set time automatically from the internet." >> ~/.config/i3/config
echo -e "exec_always --no-startup-id ~/.config/config_time.sh ${NTP}" >> ~/.config/i3/config

puts "Installing NeoVim Plugins."
nvim -c ":PackerInstall" -c ":qall"

clear
puts "Installing AUR Packages (ly, nvm, sc-im, polybar and betterlockscreen)."
yay -S ly nvm sc-im polybar betterlockscreen --nodiffmenu
sudo systemctl enable ly
source /usr/share/nvm/init-nvm.sh

puts "Installing latest LTS version of NodeJS and npm."
nvm install --lts

puts "Installing pip packages."
pip3 install flask pygame

puts "Installing npm packages."
npm install -g @vue/cli

sudo rm -rf /ArchBuild/

puts "Done! You can now reboot and log into your new system."
rm -rf ~/ArchBuild
