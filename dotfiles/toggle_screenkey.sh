#!/usr/bin/env bash

if [ -z $(pgrep screenkey) ]; then
	screenkey
else
	killall screenkey
fi
