!/bin/bash
pid=$(ps -e --format pid,pcpu,comm --sort pcpu |fzf --header-lines 1|awk '{print$1}')
kill $pid
