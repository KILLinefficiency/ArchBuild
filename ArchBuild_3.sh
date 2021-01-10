#!/bin/bash

# Tools for the Window Manager:
sudo pacman -S alacritty feh picom xmonad xmoand-contrib xmobar ttf-hack ttf-font-awesome rofi i3lock --noconfirm

# Editors:
sudo pacman -S nano vim --noconfirm

# File Managers:
sudo pacman -S ranger --noconfirm

# Browsers:
sudo pacman -S firefox chromium opera --noconfirm

# Developer Tools:
sudo pacman -S python3 python-pip gcc clang nasm --noconfirm

# Virtualization Tools:
sudo pacman -S qemu virtualbox virtualbox-host-modules-arch --noconfirm

# Document Readers:
sudo pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps --noconfirm

# Media:
sudo pacman -S vlc --noconfirm

# Others:
sudo pacman -S neofetch htop bat imagemagick man tree zip unzip wget --noconfirm

# Patching Drivers:
sudo modprobe vboxdrv

# Setting up the .bashrc file for the root user:
sudo cp dotfiles/bashrc_root /root/.bashrc
