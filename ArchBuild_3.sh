#!/bin/bash

sudo pacman -Sy --noconfirm

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

# Document Reader:
sudo pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps --noconfirm

# Torrent Client:
sudo pacman -S transmission-qt --noconfirm

# Media Tools:
sudo pacman -S vlc rhythmbox --noconfirm

# Fonts:
sudo pacman -S ttf-hack ttf-font-awesome --noconfirm

# Others:
sudo pacman -S neofetch htop bashtop bat imagemagick man tree zip unzip wget screenkey gparted --noconfirm

# Patching Drivers:
sudo modprobe vboxdrv

# Setting up the .bashrc file for the root user:
sudo cp dotfiles/bashrc_root /root/.bashrc

# Setting up dotfiles that need root user ownership:
sudo cp dotfiles/picom.conf /etc/xdg/picom.conf
sudo cp dotfiles/grub /etc/default/grub
sudo cp dotfiles/grub_bg.png /root/grub_bg.png
sudo grub-mkconfig -o /boot/grub/grub.cfg
