let mapleader=','

" so ~/.config/nvim/plugins.vim
so ~/.config/nvim/plugins.lua
so ~/.config/nvim/mappings.vim
so ~/.config/nvim/defaults.vim
so ~/.config/nvim/lsp.lua
so ~/.config/nvim/theme.lua
so ~/.config/nvim/bufferline.lua
so ~/.config/nvim/lualine.lua
" so ~/.config/nvim/wl.lua

let g:vsnip_filetypes = {}

""-------------------auto command
autocmd BufWritePost {init,mappings,defaults}.vim source %
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
" autocmd TextChanged,InsertLeave *.{js,ts,vue,go} Neoformat
autocmd BufWritePost * Neoformat
""-----------neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_lua_luaformat={
            \ 'exe': 'lua-format',
            \ 'args': ['-c ~/.config/luaformat'],
            \ }



