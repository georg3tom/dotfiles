#!/bin/bash

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
