#!/bin/bash

MYSOUNDCARD="Intel"

ADDRESS=$(pwd)

asoundconf set-default-card ${MYSOUNDCARD}

mkdir ~/Documents ~/Downloads ~/Music ~/Videos ~/Pictures ~/Projects ~/Repositories ~/Junk ~/.aur ~/.config
cd ~/.aur
git clone https://aur.archlinux.org/yay.git/
cd yay
makepkg -si

cd $ADDRESS

mkdir ~/.config/rofi
mkdir ~/.config/nvim
mkdir ~/.config/zathura
mkdir ~/.config/awesome
mkdir ~/.config/alacritty

cp dotfiles/bashrc ~/.bashrc
cp dotfiles/xinitrc ~/.xinitrc
cp dotfiles/init.vim ~/.config/nvim/init.vim
cp dotfiles/zathurarc ~/.config/zathura/zathurarc
cp dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
cp dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

cp -r dotfiles/tools ~/.tools
cp -r dotfiles/gtk-3.0 ~/.config/gtk-3.0

cp dotfiles/rc.lua ~/.config/awesome/rc.lua
cp dotfiles/xmobarrc ~/.xmobarrc
cp dotfiles/xmonad.hs ~/.xmonad/xmonad.hs

git clone https://www.github.com/Elv13/collision.git/ ~/.config/awesome/collision

nvim -c ":PlugInstall" -c ":UpdateRemotePlugins" -c ":qall"

yay -S nvm polybar
xmonad --recompile
