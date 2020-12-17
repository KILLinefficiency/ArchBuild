#!/bin/sh

pacman -Sy git --noconfirm
timedatectl set-ntp true

# Partition 1: /dev/sda1 -> boot partition. Size: 512 MB.
# Partition 2: /dev/sda2 -> root partition. Size: rest of the disk.
fdisk /dev/sda

mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
