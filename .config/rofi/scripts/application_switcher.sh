#!/bin/bash

# Search through open programs and switch to their tag
# original source: https://github.com/orschiro/dmenu-scripts-collection/blob/master/dmenu_running_apps/dmenu_running_apps
# http://spiralofhope.com/wmctrl-examples.html


application=$(
    # List all running programs
    wmctrl -l |\

    # Titles only
    cut -d' ' -f5- |\

    # Pipe to dmenu ($@ to include font settings from dwm/config.h)
    rofi -dmenu -i -p 'Switch to' $DMENU_OPTIONS -config ~/.config/rofi/themes/appsmenu.rasi
)

# remove special characters that mess up with xdotool search ([]~)
application=$(echo $application | sed 's/\[/./' | sed 's/\]/./' | sed 's/\~/./')
# temp=$(echo $application | grep NVIM)
# if [ -n temp ]
# then
#     application=$(echo $application | cut -d " " -f 1)
#     echo $application
# fi
# Switch to chosen application
case $application in
    gimp | truecrypt)
        xdotool search --onlyvisible -classname "$application" windowactivate &> /dev/null
        ;;
    *)
        xdotool search ".*${application}.*" windowactivate &> /dev/null
        ;;
esac
