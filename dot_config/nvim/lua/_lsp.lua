local u = require("utils")

local opts = { noremap = true, silent = true }
u.map("n", "<Leader><space>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
u.map("n", "<Leader>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
u.map("n", "<Leader>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
u.map("n", "<Leader>d", "<Cmd>Telescope lsp_definitions<CR>", opts)
u.map("n", "<Leader>la", "<cmd>Telescope lsp_code_actions<CR>", opts)
u.map("n", "<Leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
u.map("n", "<Leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)
u.map("n", "<Leader>ll", "<cmd>Telescope diagnostics<CR>", opts)
u.map("n", "<Leader>lr", "<cmd>Telescope lsp_references<CR>", opts)
u.map("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
u.map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
u.map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

local on_attach = function(_, bufnr)
	require("lsp_signature").on_attach({
		handler_opts = {
			border = "shadow", -- double, single, shadow, none
		},
	})
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
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
	Class = "ﴯ",
	Color = "",
	Constant = "",
	Constructor = "𝌸",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "ﰠ",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "£",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "$",
}

-- require("luasnip/loaders/from_vscode").lazy_load({})
local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			return vim_item
		end,
	},
	sorting = {
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.offset,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.length,
			cmp.config.compare.sort_text,
			cmp.config.compare.order,
		},
	},
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 1 },
		{ name = "buffer", group_index = 2 },
		{ name = "path", group_index = 2 },
		{ name = "spell", group_index = 3 },
	}),
	experimental = {
		native_menu = false,
		ghost_text = { hl_group = "Comment" },
	},
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
--
-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
-- lsp-install
local function setup_servers()
	local servers = {
		"bashls",
		"cssls",
		"emmet_ls",
		"gopls",
		"golangci_lint_ls",
		"jsonls",
		"tailwindcss",
		"rust_analyzer",
		"tsserver",
		"vimls",
		-- "html",
		-- "intelephense",
		-- "vuels",
		-- "volar",
		"ccls",
	}
	local nvim_lsp = require("lspconfig")

	nvim_lsp.phpactor.setup({
		cmd = { "/home/smoka/.local/share/nvim/site/pack/packer/opt/phpactor/bin/phpactor", "language-server" },
	})

	nvim_lsp.volar.setup({
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
		init_options = {
			typescript = {
				serverPath = "/home/smoka/.node_modules/lib/node_modules/typescript/lib/tsserverlibrary.js",
			},
		},
	})

	nvim_lsp.html.setup({ filetypes = {
		"php",
		"vue",
		"html",
	} })

	nvim_lsp.sumneko_lua.setup({
		cmd = { "/usr/bin/lua-language-server" },
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

	nvim_lsp.emmet_ls.setup({ filetypes = { "php", "vue", "html" } })
	-- nvim_lsp.tsserver.setup({
	-- 	filetypes = {
	-- 		"javascript",
	-- 		"js",
	-- 		"vue",
	-- 		"javascriptreact",
	-- 		"javascript.jsx",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"typescript.tsx",
	-- 	},
	-- })
	for _, server in pairs(servers) do
		nvim_lsp[server].setup({ on_attach = on_attach, capabilities = capabilities })
	end
end

setup_servers()
--
local nullLs = require("null-ls")
nullLs.setup({
	sources = {
		nullLs.builtins.diagnostics.write_good,
		nullLs.builtins.code_actions.gitsigns,
		nullLs.builtins.code_actions.eslint_d,
		nullLs.builtins.formatting.fish_indent,
		nullLs.builtins.diagnostics.eslint_d,
		nullLs.builtins.formatting.eslint_d,
		nullLs.builtins.formatting.gofumpt,
	},
})