#!/usr/bin/env bash

source ./config.sh

puts "Installing NTP, Git, Grub, Base Development Tools, Network Tools, Network Services, Bluetooth Tools and Arch Install Scripts."
pacman -Sy ntp git gitui dhcpcd networkmanager grub efibootmgr base-devel net-tools openssh bluez bluez-utils bluez-tools arch-install-scripts --noconfirm

puts "Enabling dhcpcd, bluetooth and NetworkManager Services."
systemctl enable dhcpcd
systemctl enable bluetooth
systemctl enable NetworkManager

puts "Setting localtime."
ln -sf /usr/share/zoneinfo/${MYTIMEZONE} /etc/localtime

puts "Setting Hardware Clock time."
hwclock --systohc

puts "Setting locales."
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

puts "Setting hostname."
echo "${MYHOSTNAME}" >> /etc/hostname
echo "127.0.0.1 localhost ${MYHOSTNAME}" >> /etc/hosts

clear
puts "Setting root password."
echo "Set root Password..."
passwd root

useradd -m -d /home/${MYUSERNAME} ${MYUSERNAME} --badnames
puts "Set password for ${MYUSERNAME}."
echo "Set Password for ${MYUSERNAME}..."
passwd ${MYUSERNAME}

puts "Adding User to /etc/sudoers file."
echo "${MYUSERNAME} ALL=(ALL) ALL" >> /etc/sudoers
echo "${MYUSERNAME} ALL=(ALL) NOPASSWD: /sbin/ntpdate" >> /etc/sudoers

puts "Installing Microcode Package."
pacman -S ${PROCESSOR}-ucode --noconfirm

puts "Installing Grub."
grub-install /dev/${DISK} --efi-directory="/boot"
puts "Configuring Grub."
grub-mkconfig -o /boot/grub/grub.cfg

puts "Installing xorg packages."
pacman -S arandr xorg-server xorg-xinit xorg-xrandr xorg-xsetroot --noconfirm

puts "Setting up the audio."
pacman -S alsa-utils pamixer asoundconf pulseaudio --noconfirm
usermod -a -G audio ${MYUSERNAME}
gpasswd -a ${MYUSERNAME} audio

puts "Installing Editors."
pacman -S nano neovim --noconfirm
ln -sf $(which nvim) /bin/vi
ln -sf $(which nvim) /bin/vim

puts "Installing Packer for NeoVim."
sudo -u ${MYUSERNAME} git clone https://github.com/wbthomason/packer.nvim /home/${MYUSERNAME}/.local/share/nvim/site/pack/packer/start/packer.nvim

puts "Copying ArchBuild directory to the Home directory."
cp -r ../ArchBuild /home/${MYUSERNAME}/
chown -R ${MYUSERNAME}:${MYUSERNAME} /home/${MYUSERNAME}/ArchBuild

puts "Done! Proceed with the ArchBuild_3.sh script."
