set nocompatible
set number
set relativenumber
set laststatus=2
set noshowmode
set wildmenu
set hidden
set title
set autoread
syntax enable
let mapleader=','
so ~/.vim/plugins.vim
set clipboard=unnamedplus
set whichwrap=b,s,<,>,[,]
colorscheme OceanicNext
"--------------------tab
set expandtab
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set ai
set autoindent
set smartindent
let g:indent_guides_enable_on_vim_startup = 1         "indent guides enabled by
"default
"-------------------tab


"-------------------visuals
set t_CO=256
set hlsearch
nmap <Leader><space> :nohlsearch<cr>
set incsearch
set ignorecase 
set smartcase
" hi vertsplit ctermbg=bg ctermfg=gray
set showmatch
set foldcolumn=1

"-------------------visuals


"-------------------auto command
augroup autosorcing
    autocmd!
    autocmd BufWritePost .vimrc source %                                "source vimrc
augroup End
autocmd FileType javascript set formatprg=prettier\ --stdin         "prettier for js
"-------------------auto command



"-----------------------map
                            "----mapping for switching windows
nmap <C-H> <C-w>h       
nmap <C-J> <C-w>j
nmap <C-K> <C-w>k
nmap <C-L> <C-w>l
                            
nmap <C-l> :NERDTreeToggle<cr>
nmap <C-o> :CtrlPMRUFiles<cr>i
vnoremap  :Commentary<cr>
nnoremap  :Commentary<cr>
inoremap  <Esc>:Commentary<cr>i
""---------------save and quit
map zz :w<cr>
map <Leader>w :wq<cr>
map zq :wq<cr>
command W w suda://%
map <Leader>q :q!<cr>
map <Leader>p :ALEFix prettier<cr>
"-----------------------tab controls
nnoremap <C-T> :tabnew<CR>
nnoremap <C-S-Right> :tabnext<CR>
nnoremap <C-S-Left> :tabprevious<CR>
""------------------------moving lines up and down
nnoremap <S-j> :m .+1<CR>
nnoremap <S-k> :m .-2<CR>
nnoremap <S-Down> :m .+1<CR>
nnoremap <S-Up> :m .-2<CR>
inoremap <S-Down> <Esc>:m .+1<CR>i
inoremap <S-Up> <Esc>:m .-2<CR>i
vnoremap <S-j> :m '>+1<CR>
vnoremap <S-k> :m '<-2<CR>
vnoremap <S-Down> :m '>+1<CR>v
vnoremap <S-UP> :m '<-2<CR>v
"------------------------- auto complete for ( , " , ' , [ , { 
:inoremap        (  ()<Left>
:inoremap        "  ""<Left>
:inoremap        `  ``<Left>
:inoremap        '  ''<Left>
:inoremap        [  []<Left>
:inoremap      {  {}<Left>
:inoremap      <  <><Left>
" Beginning and end of line
imap <C-a> <home>
imap <C-e> <end>
"-----------------octrlp
let g:ctrlp_custom_ignore='node_modules\|git'
let g:ctlp_match_window='top,order:ttb,min:1,max:20,result:10'
"set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
