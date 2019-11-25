#!/bin/bash

killall betterlockscreen
EFFECT=

    echo $1
if [[ $1 == "suspend" ]];
then
    betterlockscreen -s $EFFECT
else
    betterlockscreen -l $EFFECT
fi
