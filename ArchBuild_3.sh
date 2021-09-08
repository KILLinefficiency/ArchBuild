#!/usr/bin/env bash

source ./config.sh

if [ $(whoami) != "root" ]; then
	echo "Run this script using sudo."
	exit
fi

pacman -Sy --noconfirm

puts "Installing tools for the Window Manager."
pacman -S alacritty i3-gaps feh network-manager-applet rofi dunst --noconfirm

puts "Installing Editors."
pacman -S nano neovim --noconfirm

puts "Installing File Managers."
pacman -S ranger nautilus ntfs-3g --noconfirm

puts "Installing Web Browsers."
pacman -S firefox chromium opera --noconfirm

puts "Installing Communication Tools."
pacman -S discord --noconfirm

puts "Installing Developer Tools."
pacman -S go gcc lua ghc nasm clang clisp sqlite swi-prolog python3 ipython valgrind python-pip jupyterlab sqlitebrowser --noconfirm

puts "Installing Virtualization Tools."
pacman -S qemu docker gnome-boxes --noconfirm

puts "Installing Archive Manager."
pacman -S file-roller --noconfirm

puts "Installing Document Reader."
pacman -S evince foliate --noconfirm

puts "Installing Scientific Tools."
pacman -S octave gnuplot --noconfirm

puts "Installing Torrent Client."
pacman -S transmission-gtk --noconfirm

puts "Installing Screenshot Tool."
pacman -S scrot --noconfirm

puts "Installing Media Tools."
pacman -S vlc sxiv rhythmbox --noconfirm

puts "Installing Fonts."
pacman -S ttf-dejavu ttf-font-awesome ttf-jetbrains-mono --noconfirm

puts "Installing Icons and Themes."
pacman -S arc-gtk-theme arc-icon-theme papirus-icon-theme --noconfirm

puts "Installing Other Packages and Dependencies."
pacman -S jq bat man exa zip tree curl wget htop w3m xclip unzip rsync man-db bashtop usbutils neofetch xdg-utils screenkey youtube-dl imagemagick --noconfirm

puts "Installing Fancy Tools."
pacman -S cowsay lolcat figlet cmatrix --noconfirm

puts "Adding Docker to the docker group."
groupadd docker
usermod -aG docker ${MYUSERNAME}
systemctl enable docker
systemctl enable containerd

puts "Setting up dotfiles that need root user ownership."
cp dotfiles/bashrc_root /root/.bashrc

puts "Enabling Pacman and YAY colors."
echo "[options]" >> /etc/pacman.conf
echo "Color" >> /etc/pacman.conf

puts "Done! Proceed with the ArchBuild_4.sh script."
