#!/bin/sh
file=/tmp/claude-plan-usage
if [ ! -f "$file" ]; then
  echo "N/A"
  exit 0
fi
age=$(( $(date +%s) - $(stat -c %Y "$file") ))
if [ "$age" -gt 1800 ]; then
  echo "N/A"
  exit 0
fi
val=$(cat "$file")
five=${val%/*}
seven=${val#*/}
echo "${five}%·${seven}%"
