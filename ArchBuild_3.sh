#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "Run this script using sudo."
	exit
fi

pacman -Sy --noconfirm

# Tools for the Window Manager:
pacman -S alacritty feh picom awesome lua xmonad xmonad-contrib xmobar rofi i3lock --noconfirm

# Editors:
pacman -S nano neovim --noconfirm

# File Managers:
pacman -S ranger nautilus --noconfirm

# Browsers:
pacman -S firefox chromium opera --noconfirm

# Communication Tools:
pacman -S discord --noconfirm

# Developer Tools:
pacman -S python3 python-pip gcc clang nasm --noconfirm

# Virtualization Tools:
pacman -S qemu virtualbox virtualbox-host-modules-arch --noconfirm

# Achive Manager:
pacman -S file-roller --noconfirm

# Scientific Tools:
pacman -S gnome-calculator --noconfirm

# Document Reader:
pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps --noconfirm

# Games:
pacman -S gnuchess gnome-chess gnome-sudoku gnome-nibbles --noconfirm

# Torrent Client:
pacman -S transmission-gtk --noconfirm

# Screenshot Tool:
pacman -S scrot --noconfirm

# Media Tools:
pacman -S vlc rhythmbox --noconfirm

# Fonts:
pacman -S ttf-hack ttf-font-awesome --noconfirm

# Themes:
pacman -S arc-gtk-theme arc-icon-theme --noconfirm

# Others:
pacman -S neofetch htop bashtop bat imagemagick man tree exa zip unzip wget screenkey gparted --noconfirm

# Fancy Tools:
pacman -S cowsay lolcat figlet cmatrix --noconfirm

# Patching Drivers:
modprobe vboxdrv

# Setting up the .bashrc file for the root user:
cp dotfiles/bashrc_root /root/.bashrc

# Setting up dotfiles that need root user ownership:
cp dotfiles/picom.conf /etc/xdg/picom.conf
cp dotfiles/grub /etc/default/grub
cp dotfiles/grub_bg.png /root/grub_bg.png
grub-mkconfig -o /boot/grub/grub.cfg
