# Disk Partitions:
DISK="sda"
BOOT="sda1"
ROOT="sda2"

# Preferred Disk Partitioning Utility:
DISKUTIL="fdisk"

# User Settings:
MYUSERNAME="shreyas"
MYHOSTNAME="batcave"
MYTIMEZONE="Asia/Kolkata"

# Sound Settings:
MYSOUNDCARD="Intel"

# Processor (for Microcode Package):
PROCESSOR="intel"

# NTP Server ("in" for India):
NTP="in"

### Do not edit below this line. ###

function puts() {
	echo -e "\n\e[01;32m[*] ${1}\e[00;39m"
}
