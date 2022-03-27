let g:did_load_filetypes = 0
let g:do_filetype_lua = 1
let mapleader='\'
lua << EOF
require('impatient')
require('defaults')
require('_mapping')
require('packer_compiled')
require("_lsp")
require("treesitter")
require("_lualine")
require("_bufferline")
require('_telescope')
EOF

" so ~/.config/nvim/mappings.vim
""-------------------auto command
autocmd BufWritePost {init,mappings,defaults}.vim source %
"
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" autocmd BufWritePost *.{js,ts,vue,go,lua,php,json,rs,sh} Neoformat
" autocmd TextChanged,InsertLeave *.{js,ts,vue,go} Neoformat
"


let test#php#phpunit#executable = 'php artisan test'
let g:neovide_transparency=1
" let g:neovide_cursor_antialiasing=v:true
" let g:neovide_cursor_trail_length=1.53
" let g:neovide_cursor_animation_length=0.1

