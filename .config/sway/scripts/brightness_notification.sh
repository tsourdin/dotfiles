#!/bin/sh

# Script to create pop-up notification when brightness changes.

# Get the brightness level in percents
ACTUAL_BRIGHTNESS="$(brightnessctl g)"
MAX_BRIGHTNESS="$(brightnessctl m)"
# ACTUAL_BRIGHTNESS="$(cat /sys/class/backlight/intel_backlight/actual_brightness)"
# MAX_BRIGHTNESS="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
PERCENT_BRIGHTNESS=$(echo "$ACTUAL_BRIGHTNESS*100/$MAX_BRIGHTNESS" | bc)
ICON=~/.config/sway/icons/brightness.png

notify-send "Brightness: $PERCENT_BRIGHTNESS%" \
    -t 2000 \
    -i ${ICON} \
    -h int:value:${PERCENT_BRIGHTNESS} \
    -h string:synchronous:volume-change
