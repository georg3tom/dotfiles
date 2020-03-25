#!/usr/bin/env bash

if ! pgrep -x polybar ; then
	polybar -q classic
else
	pkill polybar
	polybar -q classic
fi
