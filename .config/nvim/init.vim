let mapleader=','

" so ~/.config/nvim/plugins.vim
so ~/.config/nvim/bufferline.lua
so ~/.config/nvim/defaults.vim
so ~/.config/nvim/debugger.lua
so ~/.config/nvim/lsp.lua
so ~/.config/nvim/lualine.lua
so ~/.config/nvim/mappings.vim
so ~/.config/nvim/plugins.lua
so ~/.config/nvim/snip.vim
so ~/.config/nvim/theme.lua
" so ~/.config/nvim/wl.lua

""-------------------auto command
autocmd BufWritePost {init,mappings,defaults}.vim source %
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
autocmd BufWritePost *.{js,ts,vue,go,lua,php,json} Neoformat
" autocmd TextChanged,InsertLeave *.{js,ts,vue,go} Neoformat
"
""-----------neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

let test#php#phpunit#executable = 'php artisan test'

set guifont=JetBrains\ Mono,Iosevka\ Term:h13
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
