#!/bin/bash

flag=$(xrandr --query | grep 'HDMI')
if [[ $flag = *" connected "* ]]; then
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 --rotate normal --output eDP1 --mode 1920x1080 --rotate normal --left-of HDMI-1-0
    bspc config -m eDP1 single_monocle false
    bspc monitor HDMI-1-0 -s eDP1
    bspc monitor HDMI-1-0  -d 1 2 3 4 5 6 7 8 9
    bspc monitor eDP1 -d 10
    bspc config -m eDP1 top_padding 0
else
    bspc monitor -d 1 2 3 4 5 6 7 8 9 10
fi
