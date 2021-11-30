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

nmap <A-Left> <C-w>h
nmap <A-Down> <C-w>j
nmap <A-UP> <C-w>k
nmap <A-Right> <C-w>l

noremap <C-l> :NvimTreeToggle<cr>
nmap <Leader>p :Telescope find_files<cr>
nmap <C-p> :Telescope live_grep<cr>
nmap <Leader>u :UndotreeToggle<cr>
nmap <Leader>f :Neoformat<cr>
nmap <Leader>s :SymbolsOutline<cr>

""-------------------------commenting
vnoremap  :Commentary<cr>
nnoremap  :Commentary<cr>
inoremap  <Esc>:Commentary<cr>i
vnoremap <C-/> :Commentary<cr>
nnoremap <C-/> :Commentary<cr>
inoremap <C-/> <Esc>:Commentary<cr>i
""-------------------------mappings for gui
map <C-s> ysiw
imap <C-\> <C-W>
imap <C-BS> <C-W>
nnoremap <C-v> "+p
inoremap <C-v> <C-o>"+p

""---------------delete and change without clipboard
" nnoremap d "_d
" vnoremap d "_d
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
"---------delete it in v0.6
"https://github.com/neovim/neovim/pull/13268
nnoremap Y y$
vnoremap Y y$
""---------------copy to plusregister
vnoremap <C-y> "+y
nnoremap <C-y> "+yy
inoremap <C-y> <C-o>"+yy
""------------------center on next
nnoremap n nzzzv
nnoremap N Nzzzv

""---------------save and quit
map zz :w<cr>
map zq :wq<cr>
map qq :q!<cr>
nmap <Leader>q :bdelete!<cr>
nmap <Leader>w :bdelete<cr>
if !exists(":W")
    command W w suda://%
endif
""--------------------tabs
" nnoremap <Leader>tk :tabnext<CR>
" nnoremap <Leader>tn :tabnew<CR>
" nnoremap <Leader>tl :tablast<CR>
" nnoremap <Leader>td :tabclose<CR>

nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>tv :TestVisit<CR>
""------------------------moving lines up and down
nnoremap <S-Down> :m .+1<CR>
nnoremap <S-Up> :m .-2<CR>
inoremap <S-Down> <C-o>:m .+1<CR>
inoremap <S-Up> <C-o>:m .-2<CR>
vnoremap <S-Down> :m '>+2<CR>gv=gv
vnoremap <S-UP> :m '<-2<CR>gv=gv
""--------------------------spell check
nnoremap <C-u> :set spell!<CR>

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

