local opts = { buffer = true }
local lsp_util = require("lspconfig.util")

--local ans =
local down = vim.fs.find("package.json", {})[1]
local cwd = vim.fs.dirname(down) or lsp_util.find_node_modules_ancestor(vim.fn.getcwd())

vim.keymap.set({ "n" }, "<space>lp", function()
	require("fzf-lua").files({ cwd = cwd })
end, opts)

vim.keymap.set({ "n" }, "<space>lr", function()
	require("fzf-lua").grep({ cwd = cwd })
end, opts)

vim.keymap.set({ "n" }, "<space>ll", function()
	require("fzf-lua").grep_last({ cwd = cwd })
end, opts)

-- if vim.g.my_filetype_vue_loaded then
-- 	return
-- end
-- vim.g.my_filetype_vue_loaded = true
