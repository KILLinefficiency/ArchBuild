#!/bin/sh

if [ $# -ne 3 ]; then
  echo "Please provide the 3 required arguments."
  echo "Usage: $0 <disk to install to> <boot partition> <root partition>"
  echo "Example usage: $0 sda sda1 sda2"
  exit
fi

echo "Are you sure you want to continue with the provided arguments? This will wipe all data on the given partitions."
read -p "Press y to continue: " confirmation_input

if [ "$confirmation_input" != 'y' ] && [ "$confirmation_input" != 'Y' ]; then
	echo "Cancelling execution."
	exit
fi

DISK=$1
BOOT=$2
ROOT=$3

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
