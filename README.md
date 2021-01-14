# ArchBuild

This repository contains all the Arch Linux install scripts written by me all of my config files.

The entire installation is divided into four Bash shell scripts.

The user must have an active internet connection and the Arch Linux ISO ready. It is advised to set up Arch Linux using these scripts inside a Virtual Machine.

* [Using the install scripts](#using-the-install-scripts)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 1](#stage-1)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 2](#stage-2)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 3](#stage-3)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 4](#stage-4)

* [Tools that I use](#tools-that-i-use)

* [My XMonad Keybindings](#my-xmonad-keybindings)

## Using the install scripts

### Stage 1

Fire your VM and boot into the Arch Linux Live ISO. Install Git:

```
pacman -Sy git --noconfirm
```

After Git is done installing, clone this repository inside the Live environment:

```
git clone https://www.github.com/KILLinefficiency/ArchBuild.git
```

``cd`` into the cloned repository:

```
cd ArchBuild
```

The installation process begins with the ``ArchBuild_1.sh`` script.

This script partitions the disk, writes file systems to the partitions, installs the system using ``pacstrap``, generates the ``fstab`` file and launches the user in the ``arch-chroot`` environment.

The script will start ``fdisk`` to partition the disk.

My Arch setup uses 512 MB of disk for the Boot partition and the rest of the disk for Arch Linux.


**ArchBuid_1.sh** by default installs the system to disk ``sda``. If you dont want to install the system to ``sda``, change the following lines in the ``ArchBuild_1.sh`` script to fit your need:

```
DISK="sda"
BOOT="sda1"
ROOT="sda2"
```

Partition 1: /dev/sdX1 -> boot partition.

Partition 2: /dev/sdX2 -> root partition.

/dev/sdX1 :
  Size: 512 MB. Sector: 2048 to 1050632
  Type: UEFI
  Bootable: Yes

/dev/sdX2
  Size : Rest of the disk. Sector: Rest of the disk.
  Type : Linux
  Bootable: No

Run the ``Arch_Build_1.sh`` script:

```
./ArchBuild_1.sh
```

The ``ArchBuild_1.sh`` script ends after putting you inside the ``arch-chroot`` environment of the newly installed system.

### Stage 2

After entering the ``arch-chroot`` environment, you'll find the cloned repository. ``cd`` into the repository:

```
cd ArchBuild
```

Stage 2 involves running the second script, ``ArchBuild_2.sh``. 

This script sets things like, locales, hostname, services, users, passwords, xorg, GRUB, etc.

Edit the following lines in ``ArchBuild_2.sh`` script to fit your needs:

```
MYUSERNAME="shreyas"
MYHOSTNAME="batcave"
MYTIMEZONE="Asia/Kolkata"
```

Run the ``ArchBuild_2.sh`` script:

```
./ArchBuild_2.sh
```

After ``ArcBuild_2.sh`` is donw running, you can either stay in the ``arch-chroot`` environment or boot into the newly installed bare system.

**Booting into the system:**

Exit the ``arch-chroot`` environment:

```
exit
```

Unmount the partitions:

```
umount -R /mnt
```

Reboot:

```
reboot
```

Now boot into the installed system with your username and password.

## Stage 3

Clone the repository again:

```
$ git clone https://www.github.com/KILLinefficiency/ArchBuild.sh
```

``cd`` into the cloned repository:

```
$ cd ArchBuild
```

Run the ``ArchBuild_3.sh`` script using ``sudo``:

```
$ sudo ./ArchBuild_3.sh
```

``ArchBuild_3.sh`` script downloads and installs all the necessary packages that I use. See [Tools that I use](#tools-that-i-use) later.

It also performs some operations that requires the root user's permission.

### Stage 4

Stage 4 invloves the ``ArchBuild_4.sh`` script.

This script copies all the configuration files I use on the newly installed system.

**This script is not supposed to be run as the root user.**

Therefore, it's recommended to boot into the installed system, login with your username and password. 

Edit this line in the ``ArchBuild_4.sh`` script to set your own soundcard:

```
MYSOUNDCARD="Intel"
```

Run the ``ArchBuild_4.sh`` script:

```
$ ./ArchBuild_4.sh
```

## Tools that I use

Here's a table of all the tools that I use and come with this Arch Linux installation.

| Category     | Tools |
|------------- | ----------- |
| Window Manager | XMonad |
| Status Bar | Xmobar |
| Wallpaper Setter | Feh |
| Compositor | Picom |
| Lock | i3lock |
| Application Launcher | Rofi |
| Bootloader | GRUB |
| Terminal | Alacritty |
| Shell | Bash |
| Editors | Nano, Vim |
| File Managers | Ranger, Nautilus |
| Web Browsers | Firefox, Chromium, Opera |
| Communication Tools | Discord |
| Virtualization Tools | QEMU, Virtualbox |
| Document Reader | Zathura |
| Torrent Client | Transmission |
| Media Tools |  Rhythmbox, VLC Media Player |
| Fonts | Hack, Font Awesome |

## My XMonad Keybindings
