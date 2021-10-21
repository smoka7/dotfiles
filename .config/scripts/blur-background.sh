#! /bin/bash
bspc subscribe | while read -r line; do
    node_num=$(bspc query --nodes --desktop any.focused | wc -l)
    if [ "$node_num" != "0" ]; then
# convert -blur 100x100 ~/Pictures/background.jpg  ~/Pictures/blur.jpg
        nitrogen --set-tiled ~/Pictures/blur.jpg
        # rm "$tmp"
    else
        nitrogen --set-tiled ~/Pictures/background.jpg
    fi
done;
