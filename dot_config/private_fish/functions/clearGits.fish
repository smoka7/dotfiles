function clearGits -d "clear git directories"
    set dirs (fd --max-depth 1 -tdirectory)
    for file in $dirs
        cd $file && git gc --prune=all
        git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
        git reflog expire --expire=now --all
        git gc --aggressive --prune=now
        cd ..
    end
end
