
#!/bin/bash

address="$HOME/.tools/bg"
current_bg_address="$HOME/.tools/current_bg.txt"
current_restore_address="$HOME/.tools/restore_bg.txt"

if ! [[ -d $address ]]; then
	mkdir $address
fi

wallpapers=()
bg_pics=$(ls $address)
total_bg_pics=$(ls $address | wc -w)

for wallpaper in ${bg_pics[@]}; do
	wallpapers+=($wallpaper)
done

if ! [[ -f $current_bg_address ]]; then
	echo "0" > $current_bg_address
fi

current=$(cat $current_bg_address)

next=$(( current + 1 ))

if [ $next -eq $total_bg_pics ] || [ $next -gt $total_bg_pics ]; then
 	next="0"
fi

echo "$next" > $current_bg_address
echo "${wallpapers[$next]}" > $current_restore_address 

feh --bg-scale "$address/${wallpapers[$next]}" 2> /dev/null

xsetroot -cursor_name left_ptr
