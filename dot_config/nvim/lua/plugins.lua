local filetypes = { 'go', 'html', 'json', 'css', 'vue', 'rust', 'js', 'ts', 'php', 'sh', 'fish', 'lua', 'vim' }
local P = {}
P.plugins = {
    { 'neovim/nvim-lspconfig' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'f3fora/cmp-spell' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp' },

            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'L3MON4D3/LuaSnip' },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufReadPre',
        dependencies = {
            { 'JoosepAlviste/nvim-ts-context-commentstring' },
            { 'RRethy/nvim-treesitter-textsubjects' },
            { 'danymat/neogen' },
            { 'mizlan/iswap.nvim' },
            { 'nvim-treesitter/nvim-treesitter-context' },
            { 'nvim-treesitter/nvim-treesitter-refactor' },
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', lazy = true },
            { 'theHamsta/nvim-treesitter-pairs' },
            { 'ThePrimeagen/refactoring.nvim' },
            { 'windwp/nvim-autopairs' },
            { 'mfussenegger/nvim-treehopper' },
        },
    },

    { 'vim-test/vim-test', lazy = true, ft = filetypes },
    { 'ray-x/go.nvim', lazy = true, ft = 'go' },
    { 'simrat39/rust-tools.nvim', lazy = true, ft = 'rust' },
    { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' }, ft = 'go', after = 'nvim-dap' },

    { 'hoob3rt/lualine.nvim', dependencies = { 'SmiteshP/nvim-gps' } },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'kyazdani42/nvim-web-devicons' },
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        lazy = true,
    },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'luukvbaal/statuscol.nvim' },

    { 'echasnovski/mini.hues' },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function()
            require('ui.colors').set_color_scheme()
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'vim', 'html' },
        config = function()
            require('colorizer').setup()
        end,
        cmd = 'ColorizerAttachToBuffer',
        lazy = true,
    },

    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'TimUntersberger/neogit',
        lazy = true,
        cmd = 'Neogit',
    },

    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup({
                direction = 'vertical',
                highlights = {},
                shade_terminals = false,
            })
        end,
    },

    { 'folke/which-key.nvim' },
    { 'folke/neodev.nvim' },
    { 'folke/twilight.nvim' },
    { 'folke/trouble.nvim' },
    { 'folke/noice.nvim' },

    { 'Pocco81/true-zen.nvim' },
    { 'booperlv/nvim-gomove' },
    { 'famiu/bufdelete.nvim', lazy = true },
    { 'ibhagwan/fzf-lua', lazy = true },
    { 'mg979/vim-visual-multi' },
    { 'numToStr/Comment.nvim' },
    { 'nvim-pack/nvim-spectre', keys = '<Leader>/', lazy = true },
    { 'nvim-telescope/telescope-ui-select.nvim', lazy = true },
    { 'nvim-telescope/telescope.nvim', lazy = true },
    { 'phaazon/hop.nvim', dev = true },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-surround' },
}
return P
