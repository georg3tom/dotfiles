#!/bin/sh

MIN=1
MAX=99
OUT=/sys/class/backlight/intel_backlight/brightness

AMBIENT=$(ffmpeg -i /dev/video0 -vf scale=1:1 -pix_fmt gray -f rawvideo -frames:v 1 -v quiet pipe:1 | od -t u | sed "s/000000[01]\s*//" | sed q)

BRIGHTNESS=$(( $AMBIENT * $MAX / 255  + 1))
light -S $BRIGHTNESS
# echo $(( $BRIGHTNESS > $MIN ? $BRIGHTNESS : $MIN )) | sudo tee $OUT
