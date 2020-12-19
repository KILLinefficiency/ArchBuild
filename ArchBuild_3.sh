#!/bin/bash

sudo pacman -S alacritty bspwm sxhkd dmenu --noconfirm

ADDRESS=$(pwd)

mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/.aur
cd ~/.aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

if ![ -f ~/.config ]; then
  mkdir ~/.config
fi

mkdir ~/.config/alacritty ~/.config/bspwm ~/.config/sxhkd

cd $ADDRESS

cp dotfiles/.bashrc ~/.bashrc
cp dotfiles/.xinitrc ~
cp dotfiles/alacritty/alacritty.yml ~/config/alacritty/alacritty.yml


sudo pacman -S gcc python3 python-pip atom --noconfirm
