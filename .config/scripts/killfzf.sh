#!/bin/fish
set pid (
    ps -e --format pid,pcpu,comm,pmem --sort -pcpu,-pmem -u $USER |
        fzf --header-lines 1 | awk '{print$1}'
)
kill $pid
