#!/bin/bash

MYSOUNDCARD="Intel"

ADDRESS=$(pwd)

asoundconf set-default-card ${MYSOUNDCARD}

mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/Projects ~/Junk ~/.aur ~/.xmonad ~/.config
cd ~/.aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd $ADDRESS

mkdir ~/.config/rofi
mkdir ~/.config/zathura
mkdir ~/.config/alacritty

cp dotfiles/vimrc ~/.vimrc
cp dotfiles/bashrc ~/.bashrc
cp dotfiles/xinitrc ~/.xinitrc
cp dotfiles/zathurarc ~/.config/zathura/zathurarc
cp dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

cp -r dotfiles/tools ~/.tools

cp dotfiles/xmobarrc ~/.xmobarrc
cp dotfiles/xmonad.hs ~/.xmonad/xmonad.hs

xmonad --recompile
