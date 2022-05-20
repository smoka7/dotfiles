local u = require('utils')

local opts = { noremap = true, silent = true }
u.map('n', '<Leader><space>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
u.map('n', '<Leader>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
u.map('n', '<Leader>]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
u.map('n', '<Leader>d', function()
  require('fzf-lua').lsp_definitions({ jump_to_single_result = true })
end, opts)
u.map('n', '<Leader>la', '<cmd>FzfLua lsp_code_actions<CR>', opts)
u.map('n', '<Leader>ld', '<Cmd>FzfLua lsp_declarations<CR>', opts)
u.map('n', '<Leader>li', '<cmd>FzfLua lsp_implementations<CR>', opts)
u.map('n', '<Leader>ll', '<cmd>FzfLua lsp_document_diagnostics<CR>', opts)
u.map('n', '<Leader>lr', '<cmd>FzfLua lsp_references<CR>', opts)
u.map('n', '<Leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
u.map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
u.map('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
u.map(
  'v',
  '<leader>ls',
  '<Esc><cmd>lua require(\'telescope\').extensions.refactoring.refactors()<CR>',
  { noremap = true }
)

-- local on_attach = function(_, bufnr)
-- 	require("lsp_signature").on_attach({
-- 		handler_opts = {
-- 			border = "shadow", -- double, single, shadow, none
-- 		},
-- 	})
-- local function buf_set_option(...)
-- 	vim.api.nvim_buf_set_option(bufnr, ...)
-- end
-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- Mappings
-- local opts = { noremap = true, silent = true, buffer = true }
-- u.map("n", "<Leader><space>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- u.map("n", "<Leader>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- u.map("n", "<Leader>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
-- u.map("n", "<Leader>d", "<Cmd>Telescope lsp_definitions<CR>", opts)
-- u.map("n", "<Leader>la", "<cmd>Telescope lsp_code_actions<CR>", opts)
-- u.map("n", "<Leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- u.map("n", "<Leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)
-- u.map("n", "<Leader>ll", "<cmd>Telescope diagnostics<CR>", opts)
-- u.map("n", "<Leader>lr", "<cmd>Telescope lsp_references<CR>", opts)
-- u.map("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- u.map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- u.map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- buf_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- if client.resolved_capabilities.document_highlight then
-- 	vim.api.nvim_exec(
-- 		[[
--   augroup lsp_document_highlight
--   autocmd! * <buffer>
--   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--   augroup END
--   ]],
-- 		false
-- 	)
-- end
-- end
