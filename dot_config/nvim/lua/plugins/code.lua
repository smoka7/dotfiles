return {

    {
        'folke/neodev.nvim',
        --cond = function()
        --    return os.getenv('NEO_DEV') == 'true'
        --end,
        --opts = {},
        -- config = function()
        --     vim.lsp.start({
        --         name = 'lua-language-server',
        --         cmd = { 'lua-language-server' },
        --         before_init = require('neodev.lsp').before_init,
        --         root_dir = vim.fn.getcwd(),
        --         settings = { Lua = {} },
        --     })
        --     --require('neodev').setup({
        --     -- add any options here, or leave empty to use the default settings
        --     --})
        -- end,
    },
    {
        'neovim/nvim-lspconfig',
        event = 'VeryLazy',
        config = function()
            require 'lsp'
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require 'lsp.cmp'
            cmp.setup_cmp()
        end,

        event = { 'InsertEnter', 'CmdwinEnter' },
        dependencies = {
            { 'f3fora/cmp-spell' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp' },

            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'windwp/nvim-autopairs' },
            { 'saadparwaiz1/cmp_luasnip' },
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load {
                        exclude = {
                            'rust',
                        },
                    }
                end,
                dependencies = { 'rafamadriz/friendly-snippets' },
            },
            {
                'glepnir/lspsaga.nvim',
                event = 'LspAttach',
                opts = {
                    lightbulb = {
                        enable = true,
                        enable_in_insert = false,
                        sign = true,
                        sign_priority = 400,
                        virtual_text = false,
                    },
                    symbol_in_winbar = {
                        enable = true,
                        separator = ' > ',
                        ignore_patterns = {},
                        hide_keyword = true,
                        show_file = true,
                        folder_level = 2,
                        respect_root = false,
                        color_mode = true,
                    },
                },
            },
        },
    },
    {
        'bennypowers/nvim-regexplainer',
        config = function()
            require('regexplainer').setup {
                filetypes = {
                    'html',
                    'js',
                    'cjs',
                    'mjs',
                    'ts',
                    'jsx',
                    'tsx',
                    'lua',
                    'mjsx',
                },

                -- Whether to log debug messages
                debug = true,

                -- 'split', 'popup'
                display = 'popup',
            }
        end,
    },
    {
        'tomiis4/Hypersonic.nvim',
        cmd = 'Hypersonic',
        config = function()
            require('hypersonic').setup {
                -- config
            }
        end,
    },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/neotest-go',
        },
        config = function()
            require('neotest').setup {
                adapters = {
                    require 'neotest-go' {
                        experimental = {
                            test_table = true,
                        },
                        args = { '-count=1', '-timeout=60s' },
                    },
                },
            }
        end,
    },
    {
        'vim-test/vim-test',
        lazy = true,
        config = function()
            require 'plugins.opts.vim-test'
        end,
        ft = { 'go', 'vue', 'rust', 'js', 'ts', 'php', 'lua' },
    },
    { 'ray-x/go.nvim', lazy = true, ft = 'go' },
    { 'simrat39/rust-tools.nvim', lazy = true, ft = 'rust' },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        ft = 'go',
        lazy = true,
        config = function()
            require 'plugins.opts.nvim-dap'
        end,
    },
}
