#!/bin/fish
set process (
ps -e --format pid,pcpu,comm,pmem --sort -pcpu,-pmem -u $USER |
    fzf --header-lines 1
)

if test $argv[1] = all
    set name (echo $process |awk '{print$3}')
    if test $name != ""
        killall $name
        return
    end
end

set pid (echo $process | awk '{print$1}')
if test $pid != ""
    kill $pid
end
