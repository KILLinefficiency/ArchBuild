#!/bin/bash

if ! [[ -f $HOME/.tools/lock_bg.png ]]; then
	RES=$(xrandr | grep "*" | awk '{print $1}')
	WID=$(python3 -c "print(\"$RES\".split('x')[0])")
	convert -resize $WID $HOME/.tools/lock_bg.jpg $HOME/.tools/lock_bg.png
fi

i3lock -i ~/.tools/lock_bg.png
