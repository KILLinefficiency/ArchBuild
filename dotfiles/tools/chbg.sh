#!/bin/bash

if ! [[ -d bg ]]; then
	mkdir bg
fi

bg_pics=$(ls bg)
total_bg_pics=$(ls bg | wc -w)

if ! [[ -f current.txt ]]; then
	echo "1" > current.txt
fi

current=$(cat current.txt)

next=$(( current + 1 ))

if [ $next -gt $total_bg_pics ]; then
 	next="1"
fi

echo "$next" > current.txt

feh --bg-scale "bg/$next.jpg" 2> /dev/null
