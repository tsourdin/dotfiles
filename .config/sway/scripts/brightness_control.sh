#!/bin/sh

# Argument parsing

CURRENT_BACKLIGHT_PERCENT=$(echo "$(brightnessctl g) * 100 / $(brightnessctl m)" | bc )
if [ $CURRENT_BACKLIGHT_PERCENT -gt 10 ]; then
    INCREMENT_PERCENT=5
else
    INCREMENT_PERCENT=1
fi

echo $INCREMEMENT_PERCENT
if [ "$1" = "-u" ]; then
    brightnessctl s "+${INCREMENT_PERCENT}%" > /dev/null 2> /dev/null
elif [ "$1" = "-d" ]; then
    brightnessctl s "${INCREMENT_PERCENT}%-" > /dev/null 2> /dev/null
else
    echo "argument must be -u or -d"
fi

