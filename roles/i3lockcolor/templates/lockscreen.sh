#!/bin/sh

i3lock --nofork --ignore-empty-password -i {{ lockscreen_path }} --scale \
--inside-color=373445ff --ring-color=ffffffff --line-uses-inside \
--keyhl-color=d23c3dff --bshl-color=d23c3dff --separator-color=00000000 \
--insidever-color=fecf4dff --insidewrong-color=d23c3dff \
--ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+86:y+h-86" \
--radius=30 --verif-text="" --wrong-text=""