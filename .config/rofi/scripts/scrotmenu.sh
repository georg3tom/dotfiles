#!/bin/bash

rofi_command="rofi -theme themes/scrotmenu.rasi"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png
        ;;
    $area)
        scrot -s ~/Pictures/Screenshots/%b%d::%H%M%S.png
        ;;
    $window)
        sleep 1; scrot -u ~/Pictures/Screenshots/%b%d::%H%M%S.png
        ;;
esac

