#!/bin/fish
set file (cd ~/.local/share/Zeal/Zeal/docsets/ && fd --type f |fzf)
if [ $file!="" ];
    firefox-developer-edition $file 
end
