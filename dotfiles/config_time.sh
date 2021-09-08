#!/usr/bin/env bash

while [ true ]; do
	if [ "$(ping -c 1 archlinux.org)" ]; then
		sudo ntpdate ${1}.pool.ntp.org
		~/.config/polybar/launch.sh
		break
	fi
done
