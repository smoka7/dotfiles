require("Comment").setup({})
local map = require("utils").map
local opts = { noremap = true, silent = true, expr = true }
local cmd =
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']]
local icmd =
	[[v:count == 0 ? '<Esc><CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$i' : '<Esc><CMD>lua require("Comment.api").toggle_linewise_count()<CR>i']]

map("v", "<C-/>", cmd, opts)
map("n", "<C-/>", cmd, opts)
map("i", "<C-/>", icmd, opts)
map("v", "", cmd, opts)
map("i", "", icmd, opts)
map("n", "", cmd, opts)
