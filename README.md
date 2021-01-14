# ArchBuild

This repository contains all the Arch Linux install scripts written by me all of my config files.

The entire installation is divided into four Bash shell scripts.

The user must have an active internet connection and the Arch Linux ISO ready. It is advised to set up Arch Linux using these scripts inside a Virtual Machine.

## Using the scripts

1. Fire your VM and boot into the Arch Linux Live ISO. Install Git:

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

Run the ``ArchBuild_1.sh`` script:

```
./ArchBuild_1.sh
```
