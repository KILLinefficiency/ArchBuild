#!/bin/bash

ADDRESS=$(pwd)

mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/.aur
cd ~/.aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd $ADDRESS

mkdir ~/.xmonad
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty

cp dotfiles/vimrc ~/.vimrc
cp dotfiles/bashrc ~/.bashrc
cp dotfiles/xinitrc ~/.xinitrc
cp dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
cp dotfiles/alacritty.yml ~/config/alacritty/alacritty.yml

cp -r dotfiles/tools ~/.tools

cp dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
cp dotfiles/xmobarrc ~/.xmobarrc
