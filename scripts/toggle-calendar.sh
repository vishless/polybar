#!/bin/bash

if pgrep -x yad > /dev/null; then
    pkill -x yad
else
    yad --calendar \
        --undecorated \
        --fixed \
        --no-buttons \
        --close-on-unfocus \
        --geometry=230x180 &
fi
