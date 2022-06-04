local nvim_lsp = require('lspconfig')
local servers = {
  'bashls',
  'ccls',
  'emmet_ls',
  'golangci_lint_ls',
  'gopls',
  'html',
  'jsonls',
  'phpactor',
  'rust_analyzer',
  -- 'tailwindcss',
  -- "tsserver",
  'vimls',
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

-- nvim_lsp.phpactor.setup({
-- 	cmd = { "/home/smoka/.local/share/nvim/site/pack/packer/opt/phpactor/bin/phpactor", "language-server" },
-- })

nvim_lsp.cssls.setup({
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
})

nvim_lsp.volar.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    typescript = {
      serverPath = '/home/smoka/.node_modules/lib/node_modules/typescript/lib/tsserverlibrary.js',
    },
  },
})

-- nvim_lsp.html.setup({
-- 	filetypes = { "vue", "html" },
-- })

nvim_lsp.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = {
        globals = { 'vim', 'love' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})

nvim_lsp.emmet_ls.setup({
  filetypes = { 'vue', 'html' },
})

local on_attach = function()
  require('lsp_signature').on_attach({
    handler_opts = {
      border = 'single', -- double, single, shadow, none
    },
  })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
  nvim_lsp[server].setup({ on_attach = on_attach, capabilities = capabilities })
end

require('lsp.tailwind')
