#!/bin/bash

if pgrep -x yad > /dev/null; then
    pkill -x yad
else
    BAR_HEIGHT=$(awk '/^\[bar\/primary\]/{found=1} found && /^height/{print $3; exit}' ~/.config/polybar/config.ini)

    # Get primary monitor geometry
    GEOM=$(xrandr --query | grep " connected primary" | grep -oP '\d+x\d+\+\d+\+\d+')
    MON_W=$(echo $GEOM | cut -dx -f1)
    MON_X=$(echo $GEOM | grep -oP '(?<=\+)\d+' | sed -n '1p')

    CAL_PX_W=300
    CAL_X=$((MON_X + MON_W - CAL_PX_W))

    yad --calendar \
        --undecorated \
        --fixed \
        --no-buttons \
        --close-on-unfocus \
        --width=$CAL_PX_W \
        --posx=$CAL_X \
        --posy=$BAR_HEIGHT &
fi
