#!/bin/sh
sleep 5
MOUSE="/sys/bus/usb/devices/1-2/power/control";
if [ -f "$MOUSE" ]; then
	echo 'on' > $MOUSE;
fi
# @reboot sudo /home/george/.config/powertop/mouse.sh
