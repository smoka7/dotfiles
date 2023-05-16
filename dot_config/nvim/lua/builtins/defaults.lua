--vim.g.mapleader = "\\"

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

-- vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.arabicshape = false
vim.opt.completeopt = 'menu,menuone,preview'
vim.opt.cmdheight = 0
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.fillchars = { eob = ' ', fold = ' ', foldopen = '', foldclose = '', foldsep = ' ' }
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.ignorecase = true -- Ignore case
vim.opt.listchars:append('tab:->,space:.')
vim.opt.mouse = 'a' -- enable mouse mode
vim.opt.mousemodel = 'extend'
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.ruler = false
vim.opt.scrolloff = 12 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.signcolumn = 'yes:2'
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.termguicolors = true -- True color support
vim.opt.undofile = true -- persist undo tree for eachfile
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wildignorecase = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- TreeSitter folding
vim.opt.foldmethod = 'expr' -- TreeSitter folding
vim.opt.foldcolumn = '1'
--vim.opt.foldmethod = 'indent' -- TreeSitter folding
