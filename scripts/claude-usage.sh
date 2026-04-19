#!/bin/sh
file=/tmp/claude-plan-usage
if [ ! -f "$file" ]; then
  echo "N/A"
  exit 0
fi
val=$(cat "$file")
five=${val%/*}
seven=${val#*/}
echo "${five}%·${seven}%"
