#!/bin/bash

rofi_command="rofi -theme themes/scrotmenu.rasi"

### Options ###
screen=""
area=""
window=""
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
NOW=$(date '+%Y%b%d::%H%M%S');
FILENAME=~/Pictures/Screenshots/$NOW.png
case $chosen in
    $screen)
        sleep 0.3; scrot $FILENAME && \
        notify-send "􀏫 Cheese!" "Screeshot saved to ~/Pictures/Screenshots" \
		&& xclip -selection clipboard -t image/png -i $FILENAME
        ;;
    $area)
        scrot -s $FILENAME && \
        notify-send "􀏫 Cheese!" "Screeshot saved to ~/Pictures/Screenshots" \
		&& xclip -selection clipboard -t image/png -i $FILENAME
        rm $FILENAME
        ;;
    $window)
        sleep 0.3; scrot -u $FILENAME && \
        notify-send "􀏫 Cheese!" "Screeshot saved to ~/Pictures/Screenshots" \
		&& xclip -selection clipboard -t image/png -i $FILENAME
        ;;
esac

