local opts = { noremap = true, silent = true, expr = true }
local keymap = vim.api.nvim_set_keymap
keymap(
	"v",
	"<C-/>",
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']],
	opts
)
keymap(
	"n",
	"<C-/>",
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']],
	opts
)
keymap(
	"i",
	"<C-/>",
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']],
	opts
)
keymap(
	"v",
	"",
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']],
	opts
)
keymap(
	"n",
	"",
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']],
	opts
)
keymap(
	"i",
	"",
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']],
	opts
)
