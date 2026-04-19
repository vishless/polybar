#!/bin/bash
nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{printf "%d%%", $1}'
