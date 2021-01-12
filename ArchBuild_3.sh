#!/bin/bash

# Tools for the Window Manager:
sudo pacman -S alacritty feh picom xmonad xmoand-contrib xmobar rofi i3lock --noconfirm

# Editors:
sudo pacman -S nano vim --noconfirm

# File Managers:
sudo pacman -S ranger nautilus --noconfirm

# Browsers:
sudo pacman -S firefox chromium opera --noconfirm

# Developer Tools:
sudo pacman -S python3 python-pip gcc clang nasm --noconfirm

# Virtualization Tools:
sudo pacman -S qemu virtualbox virtualbox-host-modules-arch --noconfirm

# Document Readers:
sudo pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps --noconfirm

# Media:
sudo pacman -S vlc rhythmbox --noconfirm

# Fonts:
sudo pacman -S ttf-hack ttf-font-awesome --noconfirm

# Others:
sudo pacman -S neofetch htop bat imagemagick man tree zip unzip wget screenkey --noconfirm

# Patching Drivers:
sudo modprobe vboxdrv

# Setting up the .bashrc file for the root user:
sudo cp dotfiles/bashrc_root /root/.bashrc

# Setting up dotfiles that have root user ownership:
sudo cp dotfiles/picom.conf /etc/xdg/picom.conf
