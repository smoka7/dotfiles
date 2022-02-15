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


