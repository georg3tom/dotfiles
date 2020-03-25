#!/bin/bash

[[ !(-n "pidof i3lock") ]] && exit

IMGPATH=/home/george/.cache/i3lock/current/lock.png
LOCK=1

APP=i3lock


while [[ "$#" -gt 0 ]]; do
  case "${1:-}" in
    -s|--suspend)
        SUSPEND=1
        shift 1
        ;;
    -i|--image)
        LOCK=
        RES=$(xrandr -q | head -3 | tail -1 | awk '{print $1}')
        convert "$2" -resize "$RES" -blur 0x6 "$IMGPATH"
        shift 2
        ;;
    -S|--systemd)
        i3lock -i $IMGPATH -c 000000 -e -f
        exit
        ;;
    *)
        exit
        ;;
    esac
done


if [[ $LOCK ]]
then
$APP -i $IMGPATH -c 000000 -e -f && \
    { [[ $SUSPEND ]] && systemctl suspend; }
fi
