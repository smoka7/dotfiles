local u = require("utils")

vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

local opts = { noremap = true, silent = true }

u.map("n", "<Leader><space>", function()
	vim.lsp.buf.hover()
end, opts)

u.map("n", "[d", function()
	vim.diagnostic.goto_prev()
end, opts)
u.map("n", "]d", function()
	vim.diagnostic.goto_next()
end, opts)

u.map("n", "<space>f", function()
	vim.lsp.buf.format({ async = true, name = "null-ls" })
end, opts)

u.map("n", "<Leader>r", function()
	vim.lsp.buf.rename()
end, opts)


u.map("n", "<Space>r", "<cmd>Telescope lsp_references<cr>")
u.map("n", "<Leader>s", "<cmd>Telescope lsp_document_symbols<cr>")

u.map("n", "<Space>a", "<cmd>FzfLua lsp_code_actions<CR>", opts)
u.map("n", "<Leader>ld", "<cmd>FzfLua lsp_declarations<CR>", opts)
u.map("n", "<Leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)
u.map("n", "<Leader>ll", "<cmd>FzfLua lsp_document_diagnostics<CR>", opts)
u.map("n", "<Leader>d", "<cmd>Telescope lsp_definitions<CR>", opts)

u.map("v", "<leader>ls", function()
	require("telescope").extensions.refactoring.refactors()
end, opts)
