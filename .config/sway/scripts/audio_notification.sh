#!/bin/sh

# Script to create pop-up notification when volume changes.

# Create a delay so the change in volume can be registered:
# sleep 0.05

# Get the volume and check if muted or not (STATE):
VOL=`wpctl get-volume @DEFAULT_SINK@ | awk '{print $2}'`
VOL=${VOL#0.}

# Have a different symbol for varying volume levels:
if [ $VOL == '00' ]; then
    VOL="0"
    ICON=~/.config/sway/icons/vol-mute.png
elif [ $VOL -lt "30" ]; then
    ICON=~/.config/sway/icons/vol-low.png
elif [ $VOL -lt "90" ]; then
    ICON=~/.config/sway/icons/vol-med.png
else
    ICON=~/.config/sway/icons/vol-high.png
fi

notify-send "Volume: $VOL%" \
    -t 2000 \
    -i ${ICON} \
    -h int:value:${VOL} \
    -h string:synchronous:volume-change
