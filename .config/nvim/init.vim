lua require('impatient')
let mapleader='\'
so ~/.config/nvim/defaults.vim
so ~/.config/nvim/mappings.vim

""-------------------auto command
autocmd BufWritePost {init,mappings,defaults}.vim source %
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

autocmd BufWritePost *.{js,ts,vue,go,lua,php,json,rs,sh} Neoformat
" autocmd TextChanged,InsertLeave *.{js,ts,vue,go} Neoformat
"
""-----------neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

let g:neoformat_vue_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'vue','--plugin', 'prettier-plugin-tailwindcss'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
let g:neoformat_css_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"','--plugin', 'prettier-plugin-tailwindcss'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }



let test#php#phpunit#executable = 'php artisan test'
let g:neovide_cursor_antialiasing=v:true
let g:neovide_transparency=0.1
let g:neovide_cursor_trail_length=1.53
let g:neovide_cursor_animation_length=0.1
set guifont=JetBrains\ Mono,Iosevka\ Term:h13
lua << EOF
local disabled_built_ins = {
  'gzip',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 6 do
  vim.g['loaded_' .. disabled_built_ins[i]] = 1
end
EOF
