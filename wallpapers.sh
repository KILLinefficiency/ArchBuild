#!/usr/bin/env bash

if ! [ -d ~/Pictures/Wallpapers ]; then
	git clone https://www.github.com/KILLinefficiency/Wallpapers.git ~/Pictures/Wallpapers
else
	git clone https://www.github.com/KILLinefficiency/Wallpapers.git ~/Pictures/wallpapers_git
	mv ~/Pictures/wallpapers_git/* ~/Pictures/Wallpapers/
	rm -rf ~/Pictures/wallpapers_git/
fi
