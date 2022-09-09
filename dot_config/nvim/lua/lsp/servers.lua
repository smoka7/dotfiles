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
	"yamlls",
	-- "psalm",
	-- "tailwindcss",
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
nvim_lsp.tailwindcss.setup({
	filetypes = {
		-- html
		--"aspnetcorerazor",
		--"astro",
		--"astro-markdown",
		"blade",
		--"django-html",
		--"htmldjango",
		--[[ "edge", ]]
		--[[ "eelixir", -- vim ft ]]
		--[[ "ejs", ]]
		--[[ "erb", ]]
		--[[ "eruby", -- vim ft ]]
		"gohtml",
		--[[ "haml", ]]
		--[[ "handlebars", ]]
		--[[ "hbs", ]]
		"html",
		-- 'HTML (Eex)',
		-- 'HTML (EEx)',
		--[[ "html-eex", ]]
		--[[ "heex", ]]
		--[[ "jade", ]]
		--[[ "leaf", ]]
		--[[ "liquid", ]]
		--[[ "markdown", ]]
		--[[ "mdx", ]]
		--[[ "mustache", ]]
		--[[ "njk", ]]
		--[[ "nunjucks", ]]
		--[[ "razor", ]]
		--[[ "slim", ]]
		--[[ "twig", ]]
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		-- js
		--[[ "javascript", ]]
		--[[ "javascriptreact", ]]
		--[[ "reason", ]]
		--[[ "rescript", ]]
		--[[ "typescript", ]]
		--[[ "typescriptreact", ]]
		-- mixed
		"vue",
		"svelte",
	},
})
-- nvim_lsp.psalm.setup({
--       cmd = { 'psalm' ,
--       '--language-server' },
-- })
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
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim", "love" },
			},
			workspace = {
				-- library = vim.api.nvim_get_runtime_file("",true)
			},
		},
	},
})

local on_attach = function() end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
	nvim_lsp[server].setup({ on_attach = on_attach, capabilities = capabilities })
end

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
