#!/bin/bash

CREDENTIALS_FILE="$HOME/.local/share/polybar/gmail-credentials"

if [[ ! -f "$CREDENTIALS_FILE" ]]; then
    echo "󰻞 ?"
    exit 1
fi

EMAIL=$(sed -n '1p' "$CREDENTIALS_FILE")
APP_PASSWORD=$(sed -n '2p' "$CREDENTIALS_FILE")

COUNT=$(curl -fsSu "$EMAIL:$APP_PASSWORD" "https://mail.google.com/mail/feed/atom" 2>/dev/null \
    | grep -oP '(?<=<fullcount>)\d+(?=</fullcount>)')

ICON="%{T2}"$'\ueb1c'"%{T-}"

if [[ -z "$COUNT" ]]; then
    echo "$ICON ?"
elif [[ "$COUNT" -eq 0 ]]; then
    echo "$ICON 0"
else
    echo "$ICON $COUNT"
fi