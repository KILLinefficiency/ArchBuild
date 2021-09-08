#!/bin/sh

source ./config.sh

puts "Installing Git."
pacman -Sy git --noconfirm

puts "Ensuring System Clock is accurate."
timedatectl set-ntp true

clear
puts "Partitioning the disk."
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
${DISKUTIL} /dev/${DISK}

puts "Writing FAT Filesystem to the Boot Partition."
mkfs.vfat -F32 /dev/${BOOT}

puts "Writing ext4 Filesystem to the Root Partition."
mkfs.ext4 /dev/${ROOT}

puts "Mounting the Root Partition."
mount /dev/${ROOT} /mnt

puts "Mounting the Boot Partition."
mkdir /mnt/boot
mount /dev/${BOOT} /mnt/boot

puts "Installing the Base, the Linux Kernel and the Linux Firmware."
pacstrap /mnt base linux linux-firmware

puts "Generating the /etc/fstab file."
genfstab -U /mnt >> /mnt/etc/fstab

cp -r ../ArchBuild /mnt/ArchBuild

puts "Chrooting in the newly installed base system."
puts "Done! Proceed with the ArchBuild_2.sh script."
arch-chroot /mnt
