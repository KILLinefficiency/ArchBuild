#!/bin/bash

sudo pacman -S alacritty --noconfirm

ADDRESS=$(pwd)

mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/.aur
cd ~/.aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

if ![ -f ~/.config ]; then
  mkdir ~/.config
fi

mkdir ~/.config/alacritty

cd $ADDRESS

cp dotfiles/.bashrc ~/.bashrc
cp dotfiles/.xinitrc ~
cp dotfiles/alacritty/alacritty.yml ~/config/alacritty/alacritty.yml

cd ~
mkdir ~/.suckless
cd ~/.suckless
git clone git://git.suckless.org/dwm
git clone git://git.suckless.org/dmenu
cd ~/.suckless/dmenu
make
cd ~
cd ~/.suckless/dwm
cp $ADDRESS/dotfiles/dwm/* ~/.suckless/dwm/
make

sudo pacman -S gcc python3 python-pip --noconfirm
