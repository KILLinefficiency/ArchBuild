#!/usr/bin/env bash

if [ -z $(ps -A | grep screenkey) ]; then
	screenkey
else
	killall screenkey
fi
