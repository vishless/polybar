#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Get connected monitors
MONITORS=($(xrandr --query | grep " connected" | cut -d" " -f1))
COUNT=${#MONITORS[@]}

export MONITOR_PRIMARY=${MONITORS[0]}

if [ $COUNT -ge 2 ]; then
    export MONITOR_SECONDARY=${MONITORS[1]}
    MONITOR_PRIMARY=$MONITOR_PRIMARY polybar primary &
    MONITOR_SECONDARY=$MONITOR_SECONDARY polybar secondary &
else
    MONITOR_PRIMARY=$MONITOR_PRIMARY polybar primary &
fi
