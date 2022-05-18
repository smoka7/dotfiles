vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
vim.g.mapleader = "\\"

require("impatient")
require("packer_compiled")
require("builtins")
require("colors")
require("gui")
require("lsp")
require("plugs")

vim.cmd([[
let test#php#phpunit#executable = 'php artisan test'
]])
