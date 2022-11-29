local fzf = require("fzf-lua")
fzf.setup({
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
vim.keymap.set("n", "<Leader>p", function()
	fzf.files()
end)
vim.keymap.set("n", "<Space>p", function()
	fzf.grep()
end)
vim.keymap.set("n", "<Space>c", function()
	fzf.grep_cword()
end)
vim.keymap.set("n", "<C-p>", function()
	fzf.grep_last()
end)
vim.keymap.set("n", "<Leader>hh", function()
	fzf.help_tags()
end)
--vim.keymap.set("n", "<Space>g", ":FzfLua git_status<cr>")
vim.keymap.set("n", "<Space>g", ":Telescope git_status<cr>")
vim.keymap.set("n", "<Leader>b", ":Telescope buffers<cr>")
