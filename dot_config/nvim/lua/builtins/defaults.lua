--vim.g.mapleader = "\\"
local g = vim.g
local opt = vim.opt
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0

-- vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.arabicshape = false
opt.completeopt = 'menu,menuone,preview'
opt.cmdheight = 0
opt.cursorline = true -- Enable highlighting of the current line
opt.fillchars = { eob = ' ', fold = ' ', foldopen = '', foldclose = '', foldsep = ' ' }
opt.expandtab = true -- Use spaces instead of tabs
opt.ignorecase = true -- Ignore case
opt.iskeyword:append '-' -- Treat dash separated words as a word text object
opt.listchars:append 'tab:->,space:.'
opt.mouse = 'a' -- enable mouse mode
opt.mousemodel = 'extend'
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.ruler = false
opt.scrolloff = 12 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4
opt.showmatch = true
opt.showcmd = false
opt.showmode = false
opt.signcolumn = 'yes:2'
opt.smartcase = true -- Don't ignore case with capitals
opt.splitright = true
opt.splitbelow = true
opt.smartindent = true -- Insert indents automatically
opt.timeoutlen = 400
opt.termguicolors = true -- True color support
opt.undofile = true -- persist undo tree for eachfile
opt.whichwrap = 'b,s,<,>,[,]'
opt.wildignorecase = true

opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- TreeSitter folding
opt.foldmethod = 'expr' -- TreeSitter folding
opt.foldcolumn = '1'
--opt.foldmethod = 'indent' -- TreeSitter folding
opt.guifont = 'Iosevka SS17 Medium,Noto Color Emoji:h12'
-- vim.opt.guifont = "JetBrains Mono,Iosevka Term:h12"
-- vim.opt.guifont = "FiraCode Nerd Font:h12"
-- vim.opt.linespace = 2

g.neovide_transparency = 1
g.neovide_window_floating_blur = 0
g.neovide_window_floating_opacity = 0
g.neovide_floating_blur = 0
g.neovide_floating_opacity = 1
