#!/bin/sh

date() {
    txt=$(~/.config/scripts/pcal/pcal.sh -t)
    notify-send -a "today" "$txt"
}

