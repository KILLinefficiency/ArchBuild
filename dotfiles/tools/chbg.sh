#!/bin/bash

address="$HOME/.tools/bg"
current_bg_address="$HOME/.tools/current_bg.txt"

if ! [[ -d $address ]]; then
	mkdir $address
fi

bg_pics=$(ls $address)
total_bg_pics=$(ls $address | wc -w)

if ! [[ -f $current_bg_address ]]; then
	echo "1" > $current_bg_address
fi

current=$(cat $current_bg_address)

next=$(( current + 1 ))

if [ $next -gt $total_bg_pics ]; then
 	next="1"
fi

echo "$next" > $current_bg_address

feh --bg-scale "$address/$next.jpg"
