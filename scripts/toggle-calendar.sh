#!/bin/bash

if pgrep -x yad > /dev/null; then
    pkill -x yad
else
    CAL_WIDTH=20
    CAL_HEIGHT=176
    BAR_HEIGHT=36

    # Get primary monitor geometry
    GEOM=$(xrandr --query | grep " connected primary" | grep -oP '\d+x\d+\+\d+\+\d+')
    MON_W=$(echo $GEOM | cut -dx -f1)
    MON_X=$(echo $GEOM | grep -oP '(?<=\+)\d+' | sed -n '1p')

    CAL_X=$((MON_X + MON_W - CAL_WIDTH))

    yad --calendar \
        --undecorated \
        --fixed \
        --no-buttons \
        --close-on-unfocus \
        --geometry=${CAL_WIDTH}x${CAL_HEIGHT}+${CAL_X}+${BAR_HEIGHT} &
fi
