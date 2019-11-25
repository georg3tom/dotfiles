#!/usr/bin/env bash

if ! pgrep -x polybar ; then
	polybar classic
else
	pkill polybar
	polybar classic
fi
