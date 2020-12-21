#!/bin/bash

pacman -Sy git dhcpcd networkmanager grub efibootmgr base-devel --noconfirm

systemctl enable dhcpcd
systemclt enable NetworkManager

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "batcave" >> /etc/hostname
echo "127.0.0.1 localhost batcave" >> /etc/hosts

passwd root

useradd -m -d /home/shreyas shreyas
passwd shreyas
echo "shreyas ALL=(ALL) ALL" >> /etc/sudoers

grub-install /dev/sda --efi-directory="/boot"
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S xorg xorg-xinit --noconfirm

pacman -S nano vim ttf-hack neoetch htop bat groff
pacman -Rns xorg-fonts-75dpi xorg-fonts-100dpi

exit
