#!/bin/bash

pacman -Sy git dhcpcd networkmanager grub efibootmgr base-devel --noconfirm

systemctl enable dhcpcd
systemclt enable NetworkManager

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "corvo" >> /etc/hostname
echo "127.0.0.1 localhost corvo" >> /etc/hosts

passwd root

useradd -m -d /home/shreyas Shreyas --force-badname
passwd Shreyas
echo "Shreyas ALL=(ALL) ALL" >> /etc/sudoers

grub-install /dev/sda --efi-directory="/boot"
grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S xorg xorg-init --noconfirm
