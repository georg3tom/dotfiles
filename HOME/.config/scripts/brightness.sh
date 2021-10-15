#!/bin/bash


ICON="~/.config/scripts/icons/sun.svg"

function getBacklight {
	light -G|awk -F"." '{print $1}'
}

function sendNotification {
    backlight=`getBacklight`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($backlight / 8)) | sed 's/[0-9]//g')
    # Send the notification

    dunstify -i $ICON  -t 900 -r 2593 -u normal "   $bar"
}

case $1 in
    up)
        x=$(light)
        if (( $(echo "$x < 5" |bc -l) ))
        then
            light -S 5
        elif (( $(echo "$x < 10" |bc -l) ))
        then
            light -S 10
        else
            light -A 10
        fi
        ;;
    down)
        x=$(light)
        if (( $(echo "$x <= 5" |bc -l) ))
        then
            light -S 1
        elif (( $(echo "$x <= 10" |bc -l) ))
        then
            light -S 5
        else
            light -U 10
        fi
esac
