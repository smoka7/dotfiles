local nvim_lsp = require 'lspconfig'

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

if os.getenv 'NEO_DEV' == 'true' then
    require('neodev').setup {
        library = {
            enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
            -- these settings will be used for your Neovim config directory
            runtime = true, -- runtime path
            types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = true, -- installed opt or start plugins in packpath
            -- you can also specify the list of plugins to make available as a workspace library
            -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        },
        setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
        -- for your Neovim config directory, the config.library settings will be used as is
        -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
        -- for any other directory, config.library.enabled will be set to false
        override = function(root_dir, options) end,
        -- With lspconfig, Neodev will automatically setup your lua-language-server
        -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
        -- in your lsp start options
        lspconfig = true,
        -- much faster, but needs a recent built of lua-language-server
        -- needs lua-language-server >= 3.6.0
        pathStrict = true,
    }
    --override = function(root_dir, options)
    --    return true
    --end,
end

local on_attach = function(client, bufnr)
    -- vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost', 'BufEnter' }, {
    --     callback = function()
    --         --require('vim.lsp._inlay_hint').refresh()
    --     end,
    --     group = vim.api.nvim_create_augroup('lsp', {
    --         clear = true,
    --     }),
    --     buffer = bufnr,
    -- })
end

for _, server in pairs(servers) do
    local success, custom = pcall(require, 'lsp.servers.' .. server)
    local default = { on_attach = on_attach, capabilities = capabilities }
    if success then
        default = vim.tbl_extend('keep', custom, default)
    end
    nvim_lsp[server].setup(default)
end
