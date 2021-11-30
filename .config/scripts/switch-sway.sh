#!/bin/bash
Options="
    tabbed \n
    stacking\n
    splith \n
    splitv"
echo -e $Options |fzf |xargs -r swaymsg layout
