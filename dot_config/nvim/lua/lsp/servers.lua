local nvim_lsp = require("lspconfig")
local servers = {
	"bashls",
	"cssls",
	"golangci_lint_ls",
	"gopls",
	"html",
	"jsonls",
	"phpactor",
	"rust_analyzer",
	"vimls",
	-- 'tailwindcss',
	-- 'tsserver',
	-- 'volar',
}

-- nvim_lsp.rust_analyzer.setup({
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			cargo = {
-- 				features = { "exercises" },
-- 			},
-- 		},
-- 	},
-- })

nvim_lsp.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		typescript = {
			serverPath = "/home/smoka/node_modules/.pnpm/typescript@4.6.3/node_modules/typescript/lib/tsserverlibrary.js",
		},
	},
})

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

nvim_lsp.sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = {
				globals = { "vim", "love" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

local on_attach = function()
	require("lsp_signature").on_attach({
		handler_opts = {
			border = "single", -- double, single, shadow, none
		},
	})
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
	nvim_lsp[server].setup({ on_attach = on_attach, capabilities = capabilities })
end

local t = require("lsp.tailwind")
nvim_lsp.tailwindcss.setup({ on_attach = t.buf_attach(), capabilities = capabilities })
