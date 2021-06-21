#!/bin/bash

killall -q polybar

while pgrep -u $UID -x ploybar > /dev/null; do
	sleep 1;
done

polybar toolbar &
