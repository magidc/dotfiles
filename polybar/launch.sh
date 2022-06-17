#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "--- cron" | tee -a /tmp/polybar.log
polybar main >> /tmp/polybar.log 2>&1 &
# polybar left >> ~/tmp/polybar.log 2>&1 &
# polybar right >> ~/tmp/polybar.log 2>&1 &


echo "Bars launched..."

