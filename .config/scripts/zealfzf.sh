#!/bin/fish

if [ $argv[1]="search" ]
    cd ~/.local/share/Zeal/Zeal/docsets/ && fd --type f --color never > cache.txt
end

set file (cd ~/.local/share/Zeal/Zeal/docsets/ && cat cache.txt |fzf)
if [ $file!="" ]
    firefox-developer-edition $file
end
