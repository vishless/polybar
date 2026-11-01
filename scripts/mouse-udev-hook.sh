#!/bin/bash
export XDG_RUNTIME_DIR="/run/user/1000"

for delay in 0 2 5; do
    sleep "$delay"
    /usr/bin/polybar-msg action "#mousebattery.hook.0" >/dev/null 2>&1
done
