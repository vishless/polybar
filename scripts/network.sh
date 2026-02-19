#!/bin/bash

INTERFACE="eno1"

RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

sleep 1

RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RX_RATE=$((RX2 - RX1))
TX_RATE=$((TX2 - TX1))

format_rate() {
  if [ $1 -gt 1048576 ]; then
    printf "%.1fMB/s" "$(echo "$1 / 1048576" | bc -l)"
  elif [ $1 -gt 1024 ]; then
    printf "%.0fKB/s" "$(echo "$1 / 1024" | bc -l)"
  else
    printf "%dB/s" "$1"
  fi
}

echo "%{T2}󰈀%{T-} ↓$(format_rate $RX_RATE) ↑$(format_rate $TX_RATE)"

