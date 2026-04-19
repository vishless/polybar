#!/bin/bash
nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{
  pct = $1
  if (pct > 90)
    printf "%%{F#f38ba8}%2d%%%%{F-}", pct
  else
    printf "%2d%%", pct
}'
