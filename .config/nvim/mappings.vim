noremap ; :
noremap <Leader>z :nohlsearch<cr>
map <Home> ^
imap <Home> <Esc>^i
map <C-Left> b
map <C-Right> w
""-----------------------mapping for switching windows
noremap <Leader>v :vsplit<cr>
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>l <C-w>l

noremap <C-l> :NvimTreeToggle<cr>
nmap <Leader>p :Telescope find_files<cr>
nmap <Leader>u :UndotreeToggle<cr>
nmap <Leader>f :Neoformat<cr>
nmap <C-p> :Telescope live_grep<cr>
nmap <Leader>s :SymbolsOutline<cr>

""-------------------------commenting
vnoremap  :Commentary<cr>
nnoremap  :Commentary<cr>
inoremap  <Esc>:Commentary<cr>i
imap <C-\> <C-W>
map <C-s> ysiw

""---------------delete and change without clipboard
nnoremap d "_d
vnoremap d "_d
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap Y y$
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
imap <S-BS> <C-W>

""---------------save and quit
map zz :w<cr>
map ww :w<cr>
map zq :wq<cr>
map qq :q!<cr>
nmap <Leader>q :bdelete!<cr>
nmap <Leader>w :bdelete<cr>
if !exists(":W")
    command W w suda://%
endif
""--------------------tabs
nnoremap <Leader>tk :tabnext<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tl :tablast<CR>
nnoremap <Leader>td :tabclose<CR>

""------------------------moving lines up and down
nnoremap <S-Down> :m .+1<CR>
nnoremap <S-Up> :m .-2<CR>
inoremap <S-Down> <C-o>:m .+1<CR>
inoremap <S-Up> <C-o>:m .-2<CR>
vnoremap <S-Down> :m '>+2<CR>gv=gv
vnoremap <S-UP> :m '<-2<CR>gv=gv

function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        return "\<CR>:"
    else
        return "\<CR>"
    endif
endfunction
" show all the words matching the search then jump to it
cnoremap <expr> <Leader>/ CCR()
"replace word under cursur with prompt on the file
nnoremap <Leader>R :%s/\<<C-r><C-w>\>//g<Left><Left>

