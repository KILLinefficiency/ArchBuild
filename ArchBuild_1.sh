#!/bin/sh

DISK="sda"
BOOT="sda1"
ROOT="sda2"

pacman -Sy git --noconfirm
timedatectl set-ntp true

# Partition 1: /dev/sdX1 -> boot partition.
# Partition 2: /dev/sdX2 -> root partition.
# /dev/sdX1 :
#   Size: 512 MB. Sector: 2048 to 1050632
#   Type: UEFI
#   Bootable: Yes
# /dev/sdX2
#   Size : Rest of the disk. Sector: Rest of the disk.
#   Type : Linux
#   Bootable: No
fdisk /dev/${DISK}

mkfs.vfat -F32 /dev/${BOOT}
mkfs.ext4 /dev/${ROOT}

mount /dev/${ROOT} /mnt
mkdir /mnt/boot
mount /dev/${BOOT} /mnt/boot

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

cp -r ../ArchBuild /mnt/ArchBuild

arch-chroot /mnt
