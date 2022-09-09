require("fzf-lua").setup({
	winopts = {
		border = "none",
	},
	lsp = {
		cwd_only = true, -- LSP/diagnostics for cwd only?
	},
	git = {
		status = {
			cmd = "git status -s",
			--preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
		},
	},
})
vim.keymap.set("n", "<Space>p", ":FzfLua live_grep_native<cr>")
vim.keymap.set("n", "<Space>g", ":FzfLua git_status<cr>")
vim.keymap.set("n", "<C-p>", ":FzfLua grep_last<cr>")
vim.keymap.set("n", "<Leader>hh", ":FzfLua help_tags<cr>")
vim.keymap.set("n", "<Leader>b", ":FzfLua buffers<cr>")
vim.keymap.set("n", "<Leader>p", ":FzfLua files<cr>")
vim.keymap.set("n", "<Leader>j", ":FzfLua jumps<cr>")
