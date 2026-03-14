#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Get primary monitor (set by xrandr --primary in i3 config)
PRIMARY=$(xrandr --query | grep " connected primary" | cut -d" " -f1)

# Get secondary monitor (any connected monitor that isn't primary)
SECONDARY=$(xrandr --query | grep " connected" | grep -v "^$PRIMARY " | head -1 | cut -d" " -f1)

export MONITOR_PRIMARY=$PRIMARY

if [ -n "$SECONDARY" ]; then
    export MONITOR_SECONDARY=$SECONDARY
    MONITOR_PRIMARY=$PRIMARY polybar primary &
    MONITOR_SECONDARY=$SECONDARY polybar secondary &
else
    MONITOR_PRIMARY=$PRIMARY polybar primary &
fi
