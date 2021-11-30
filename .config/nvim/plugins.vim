filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'akinsho/nvim-bufferline.lua'
Plugin 'buoto/gotests-vim'
Plugin 'windwp/windline.nvim'
Plugin 'folke/tokyonight.nvim'
Plugin 'file:///home/smoka/celeste-nvim'
Plugin 'file:///home/smoka/nvim-phpdoc'
Plugin 'lewis6991/gitsigns.nvim'
"auto rename tag
Plugin 'AndrewRadev/tagalong.vim'
Plugin 'fatih/vim-go'
Plugin 'hoob3rt/lualine.nvim'
Plugin 'rktjmp/lush.nvim'
" Plugin 'dstein64/vim-startuptime'
Plugin 'hrsh7th/nvim-compe'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'
Plugin 'rafamadriz/friendly-snippets'
Plugin 'kabouzeid/nvim-lspinstall'
Plugin 'kyazdani42/nvim-tree.lua'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'lambdalisue/suda.vim'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'luochen1990/rainbow'
Plugin 'mattn/emmet-vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'norcalli/nvim-colorizer.lua'
" Plugin 'mhartington/oceanic-next'
" Plugin 'nanotech/jellybeans.vim'
Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'Raimondi/delimitMate'
Plugin 'ray-x/lsp_signature.nvim'
Plugin 'sbdchd/neoformat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'yashguptaz/calvera-dark.nvim'
Plugin 'vim-test/vim-test'
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on
