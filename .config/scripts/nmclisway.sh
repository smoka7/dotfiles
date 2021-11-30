#!/bin/bash
nmcli -g SSID,SIGNAL,BARS device wifi list | fzf | cut -d : -f 1 | xargs -r swaymsg -t command exec nmcli connection up
