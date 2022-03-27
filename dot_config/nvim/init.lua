vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
vim.g.mapleader = "\\"

require("impatient")
require("defaults")
require("_mapping")
require("packer_compiled")
require("_lsp")
require("treesitter")
require("_lualine")
require("_bufferline")
require("_telescope")

local id = vim.api.nvim_create_augroup("packer", {
	clear = true,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source %",
	pattern = "{init,mappings,defaults}.vim",
	once = true,
	group = id,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	pattern = "plugins.lua",
	once = true,
	group = id,
})
vim.cmd([[
let test#php#phpunit#executable = 'php artisan test'
let g:neovide_transparency=1
]])
