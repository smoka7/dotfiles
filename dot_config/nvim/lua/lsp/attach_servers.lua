local nvim_lsp = require('lspconfig')

local servers = {
    'volar',
    'bashls',
    'cssls',
    'gopls',
    'html',
    'jsonls',
    'phpactor',
    'taplo',
    'vimls',
    'yamlls',
    'lua_ls',
    'tailwindcss',
    --'golangci_lint_ls',
    --"rust_analyzer",
    -- "psalm",
    -- 'tsserver',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function() end

for _, server in pairs(servers) do
    local success, config = pcall(require, 'lsp.servers.' .. server)

    if success then
        nvim_lsp[server].setup(config)
    else
        nvim_lsp[server].setup({ on_attach = on_attach, capabilities = capabilities })
    end
end
-- nvim_lsp.rust_analyzer.setup({
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			-- cargo = {
-- 			-- 	features = { "exercises" },
-- 			-- },
-- 			-- enable clippy on save
-- 			checkOnSave = {
-- 				command = "clippy",
-- 			},
-- 		},
-- 	},
-- })

--
-- nvim_lsp.tsserver.setup({
-- 	filetypes = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"javascript.jsx",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"typescript.tsx",
-- 	},
-- })

-- local t = require("lsp.tailwind")
-- nvim_lsp.tailwindcss.setup({ on_attach = t.buf_attach(), capabilities = capabilities })
--
-- settings = {
--   gopls = {
--     analyses = {
--       unusedparams = true,
--     },
--     staticcheck = true,
--     hints = {
--       assignVariableTypes = true,
--       compositeLiteralFields = true,
--       compositeLiteralTypes = true,
--       constantValues = true,
--       parameterNames = true,
--       rangeVariableTypes = true,
--       functionTypeParameters = true,
--     },
--   },
-- },
