#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    echo "-------------" | tee -a /tmp/polybartop$m.log /tmp/polybarbottom$m.log
    MONITOR=$m polybar top 2>&1 | tee -a /tmp/polybartop$m.log & disown
    MONITOR=$m polybar bottom 2>&1 | tee -a /tmp/polybarbottom$m.log & disown
done