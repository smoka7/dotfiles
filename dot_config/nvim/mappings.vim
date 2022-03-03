noremap ; :
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
map <Home> ^
imap <Home> <Esc>^i
map <C-Left> b
map <C-Right> w
""-----------------------mapping for switching windows
noremap <Leader>v :vsplit<cr>
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l

nmap <A-Left> <C-w>h
nmap <A-Down> <C-w>j
nmap <A-UP> <C-w>k
nmap <A-Right> <C-w>l

noremap <Leader>e :NvimTreeToggle<cr>
nmap <C-p> :Telescope live_grep<cr>
nmap <Leader>p :Telescope find_files<cr>
nmap <Leader>hh :Telescope help_tags<cr>
nmap <Leader>u :UndotreeToggle<cr>
nmap <Leader>f :Neoformat<cr>
nmap <Leader>s :Telescope lsp_document_symbols<cr>

""-------------------------mappings for gui
map <C-s> ysiw
imap <C-\> <C-W>
imap <C-BS> <C-W>
nnoremap <C-v> "+p
inoremap <C-v> <Left><C-o>"+p

""---------------delete and change without clipboard
" nnoremap d "_d
" vnoremap d "_d
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
""---------------copy to plusregister
vnoremap <C-y> "+y
nnoremap <C-y> "+y
inoremap <C-y> <C-o>"+yy
""------------------center on next
nnoremap n nzzzv
nnoremap N Nzzzv

""---------------save and quit
map zz :w<cr>
map qq :q!<cr>
nmap <Leader>q :Bdelete!<cr>
nmap <Leader>w :q<cr>
nmap <Leader>c :close<cr>
if !exists(":W")
    command W w suda://%
endif
""--------------------tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tk :tabnext<CR>
nnoremap <Leader>tl :tablast<CR>
nnoremap <Leader>td :tabclose<CR>
nnoremap <S-Tab> :tabnext<CR>

nnoremap <Space>tn :TestNearest<CR>
nnoremap <Space>tl :TestLast<CR>
nnoremap <Space>tf :TestFile<CR>
nnoremap <Space>tv :TestVisit<CR>
""------------------------moving lines up and down
nmap <S-Up> <Plug>GoNSMUp
nmap <S-Down> <Plug>GoNSMDown

xmap <S-Up> <Plug>GoVSMUp
xmap <S-Down> <Plug>GoVSMDown
xmap <S-Left> <Plug>GoVSMLeft
xmap <S-Right> <Plug>GoVSMRight

inoremap <S-Down> <C-o>:m .+1<CR>
inoremap <S-Up> <C-o>:m .-2<CR>
" nnoremap <S-Down> :m .+1<CR>
" nnoremap <S-Up> :m .-2<CR>
" vnoremap <S-Down> :m '>+2<CR>gv=gv
" vnoremap <S-UP> :m '<-2<CR>gv=gv

""--------------------------spell check
nnoremap <Space>u :set spell!<CR>
