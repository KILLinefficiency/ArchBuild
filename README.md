# ArchBuild

This repository contains my [Arch Linux](https://www.archlinux.org) installation scripts and all of my configuration files.

The entire installation is divided into four shell scripts.

The user must have an active internet connection and the Arch Linux ISO ready. It is advised to set up Arch Linux using these scripts inside a Virtual Machine first.

**Read this entire README first before starting the installation using the scripts!**

## Contents

* [Making the install scripts your own](#making-the-install-scripts-your-own)

* [Using the install scripts](#using-the-install-scripts)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 1](#stage-1)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 2](#stage-2)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 3](#stage-3)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Stage 4](#stage-4)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Summary](#summary)

* [Tools that I use](#tools-that-i-use)

* [My i3 Window Manager Keybindings](#my-i3-window-manager-keybindings)

## Making the install scripts your own

Edit the ``config.sh`` file to adjust the installation to your liking.

## Using the install scripts

### Stage 1

Fire your VM and boot into the Arch Linux Live ISO. Install Git:

```
# pacman -Sy git --noconfirm
```

After Git is done installing, clone this repository inside the Live environment:

```
# git clone https://www.github.com/KILLinefficiency/ArchBuild.git
```

``cd`` into the cloned repository:

```
# cd ArchBuild
```

The installation process begins with the ``ArchBuild_1.sh`` script.

This script partitions the disk, writes file systems to the partitions, installs the system using ``pacstrap``, generates the ``fstab`` file and launches the user in the ``arch-chroot`` environment.

The script will start ``fdisk`` by default to partition the disk.

My Arch setup uses 512 MB of disk for the Boot partition and the rest of the disk for Arch Linux.

>Partition 1: /dev/sdX1 -> boot partition.
>
>Partition 2: /dev/sdX2 -> root partition.
>
>/dev/sdX1 :
>
>&nbsp;&nbsp; Size: 512 MB. Sector: 2048 to 1050632
>
>&nbsp;&nbsp; Type: EFI
>
>&nbsp;&nbsp; Bootable: Yes
>
>/dev/sdX2
>
>&nbsp;&nbsp; Size : Rest of the disk. Sector: Rest of the disk.
>
>&nbsp;&nbsp; Type : Linux
>
>&nbsp;&nbsp; Bootable: No

Run the ``Arch_Build_1.sh`` script:

```
# ./ArchBuild_1.sh
```

The ``ArchBuild_1.sh`` script ends after putting you inside the ``arch-chroot`` environment of the newly installed system.

### Stage 2

After entering the ``arch-chroot`` environment, you'll find the cloned repository. ``cd`` into the repository:

```
# cd ArchBuild
```

Stage 2 involves running the second script, ``ArchBuild_2.sh``. 

This script sets things like, locales, hostname, services, users, passwords, xorg, GRUB, etc.

Run the ``ArchBuild_2.sh`` script:

```
# ./ArchBuild_2.sh
```

After ``ArcBuild_2.sh`` is donw running, you can either stay in the ``arch-chroot`` environment or boot into the newly installed bare system.

**Booting into the system:**

Exit the ``arch-chroot`` environment:

```
# exit
```

Unmount the partitions:

```
# umount -R /mnt
```

Reboot:

```
# reboot
```

Now boot into the installed system with your username and password.

## Stage 3

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

This script copies all the configuration files I use to the newly installed system.

**This script is not supposed to be run as the root user.**

Therefore, it's recommended to boot into the installed system, login with your username and password. 

The ``ArchBuild_4.sh`` script should not be run as the root user. Do not use ``sudo``!

The installation of ``yay`` uses ``sudo`` and the script might ask you for password and confirmation a couple of times.

Run the ``ArchBuild_4.sh`` script:

```
$ ./ArchBuild_4.sh
```

Reboot your machine once ``ArchBuild_4.sh`` script is done running:

```
$ reboot
```

### Summary

Here's the summary of the installation in a table.

| Script | Run Inside | Need root? / Use sudo? |
| ------ | ---------- | ---------------------- |
| ArchBuild_1.sh | Arch Linux Live Environment | Yes |
| ArchBuild_2.sh | arch-chroot Environment | Yes |
| ArchBuild_3.sh | TTY of the newly installed system | Yes |
| ArchBuild_4.sh | TTY of the newly installed system | No |

### Tools that I use

Here's a table of all the tools that I use and come with this Arch Linux installation.

| Category     | Tools |
| ------------ | ----------- |
| Window Manager | i3-gaps |
| Status Bar | Polybar |
| Wallpaper Setter | Feh |
| Lock | betterlockscreen |
| Application Launcher | Rofi |
| Bootloader | GRUB |
| Terminal | Alacritty |
| Shell | Bash |
| Editors | NeoVim |
| GTK Theme | Arc |
| GTK Icon | Arc |
| Scientific Tools | Octave, SC-IM |
| File Managers | Nautilus |
| Archive Utility | File Roller |
| Web Browsers | Firefox, Chromium, Opera |
| Communication Tools | Discord |
| Virtualization Tools | QEMU, GNOME Boxes |
| Document Reader | Evince |
| Screenshot Tool | Scrot |
| Torrent Client | Transmission |
| Media Tools | Rhythmbox, VLC Media Player |
| Fonts | Font Awesome, Jetbrains Mono |

## My i3 Window Manager Keybindings

Here's a table of my i3 Window Manager Keybindings.

I use the Super Key (Windows Key / Mod4 Key) as the Mod Key.

| Keybinding | Action |
| ---------- | ------ |
| Super + Enter | Spawns Terminal. |
| Super + q | Closes a window. |
| Super + p | Launchs Application Launcher. |
| Super + f | Spawns File Manager. |
| Super + w | Spawns Firefox. |
| Super + l | Locks the system. |
| Super + r | Enter resize mode. |
| Super + {Arrow Keys} (Resize Mode)| Resize focused window when in resize mode. |
| Super + Shift + b | Changes wallpaper. |
| Super + PrtScr | Takes a screenshot. |
| Super + Shift + PrtScr | Takes a screenshot of the focused window. |
| Super + {number} | Switches to that numbered workspace. |
| Super + Shift + {number} | Sends the focused window to the numbered workspace. |
| Super + Shift + Space | Toggles Floating Mode. |
| Super + h | Spawn tiling windows horizontally. |
| Super + v | Spawns tiling windows vertically. |
| Super + t | Switches to Tabbed Mode. |
| Super + s | Switches to Stacking Mode. |
| Super + e | Switches to Tiling Mode. |
| Super + a | Focuses on the parent window. |
| Super + d | Focuses on the chile window. |
| Super + {Arrow Keys} | Changes focus to the next window. |
| Super + Shift + e | Quits i3 Window Manager. |
| Super + Shift + c | Reloads the ~/.config/i3/config file. |
| Super + Shift + r | Restarts i3 Window Manager. |
