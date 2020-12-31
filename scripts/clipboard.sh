#!/bin/bash

count=$( copyq count)
if [ -z "$@" ]; then
    for (( i = 0; i < 10; i++ )); do
    entry=$(copyq read $i)
    echo "$entry"
    done
    else
    if [ "$1" = "markup-rows" ]; then
        copyq count
    elif [ "$1" = "2" ]; then
        echo 2
    fi
fi
