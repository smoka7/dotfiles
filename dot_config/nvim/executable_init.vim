lua require('impatient')
lua require('defaults')
let mapleader='\'
so ~/.config/nvim/defaults.vim
so ~/.config/nvim/mappings.vim

""-------------------auto command
autocmd BufWritePost {init,mappings,defaults}.vim source %

augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" autocmd BufWritePost *.{js,ts,vue,go,lua,php,json,rs,sh} Neoformat
" autocmd TextChanged,InsertLeave *.{js,ts,vue,go} Neoformat
"


let test#php#phpunit#executable = 'php artisan test'
" let g:neovide_cursor_antialiasing=v:true
let g:neovide_transparency=1
" let g:neovide_cursor_trail_length=1.53
" let g:neovide_cursor_animation_length=0.1

