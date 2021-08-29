#!/usr/bin/env bash

if ! pgrep -x polybar ; then
	polybar -q bar
else
	pkill polybar
	polybar -q bar
fi
