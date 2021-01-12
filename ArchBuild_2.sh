#!/bin/bash

MYUSERNAME="shreyas"
MYHOSTNAME="batcave"
MYTIMEZONE="Asia/Kolkata"

pacman -Sy git dhcpcd networkmanager grub efibootmgr base-devel bluez bluez-utils bluez-tools --noconfirm

systemctl enable dhcpcd
systemctl enable bluetooth
systemctl enable NetworkManager

ln -sf /usr/share/zoneinfo/${MYTIMEZONE} /etc/localtime

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "${MYHOSTNAME}" >> /etc/hostname
echo "127.0.0.1 localhost ${MYHOSTNAME}" >> /etc/hosts

clear
echo "Set Root Password..."
passwd root

useradd -m -d /home/${MYUSERNAME} ${MYUSERNAME} --badnames
echo "Set Password for ${MYUSERNAME}..."
passwd ${MYUSERNAME}
echo "${MYUSERNAME} ALL=(ALL) ALL" >> /etc/sudoers

grub-install /dev/sda --efi-directory="/boot"
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot --noconfirm

pacman -S alsa-utils pamixer asoundconf --noconfirm
gpasswd -a ${MYUSERNAME} audio

pacman -Rns xorg-fonts-75dpi xorg-fonts-100dpi
