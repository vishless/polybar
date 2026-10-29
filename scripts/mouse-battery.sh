#!/bin/bash
device=$(upower -e | grep -i mouse | head -n1)

if [[ -z "$device" ]]; then
    echo "N/A"
    exit 0
fi

pct=$(upower -i "$device" | grep -oP 'percentage:\s*\K[0-9]+')

if [[ -z "$pct" ]]; then
    echo "N/A"
    exit 0
fi

if (( pct <= 20 )); then
    printf "%%{F#f38ba8}%d%%%%{F-}" "$pct"
else
    printf "%d%%" "$pct"
fi
