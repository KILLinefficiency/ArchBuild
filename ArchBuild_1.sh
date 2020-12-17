#!/bin/sh

pacman -Sy git --noconfirm
timedatectl set-ntp true

# Partition 1: /dev/sda1 -> boot partition.
# Partition 2: /dev/sda2 -> root partition.
# /dev/sda1 :
#   Size: 512 MB. Sector: 2048 to 1050632
#   Type: UEFI
#   Bootable: Yes
# /dev/sda2
#   Size : Rest of the disk. Sector: Rest of the disk.
#   Type : Linux
#   Bootable: No
fdisk /dev/sda

mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
