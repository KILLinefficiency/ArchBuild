#!/bin/bash

sudo rm -rf /ArchBuild
sudo pacman -S alacritty feh picom xmonad xmonad-contrib xmobar ttf-font-awesome alsa-utils pamixer --noconfirm

ADDRESS=$(pwd)

mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/.aur
cd ~/.aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

mkdir -p ~/.config/alacritty

cd $ADDRESS

cp dotfiles/bashrc ~/.bashrc
cp dotfiles/xinitrc ~/.xinitrc
cp dotfiles/vimrc ~/.vimrc
cp dotfiles/alacritty/alacritty.yml ~/config/alacritty/alacritty.yml
cp -r dotfiles/tools ~/.tools

mkdir ~/.xmonad
cp dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
cp dotfiles/xmobarrc ~/.xmobarrc
