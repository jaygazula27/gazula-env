#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
echo "-------------" | tee -a /tmp/polybarbottom.log /tmp/polybartop.log
polybar top 2>&1 | tee -a /tmp/polybartop.log & disown
polybar bottom 2>&1 | tee -a /tmp/polybarbottom.log & disown