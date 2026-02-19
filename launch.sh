#!/bin/bash

killall -q polybar
sleep 1

polybar primary &
polybar secondary &

