return {
    {
        'rebelot/kanagawa.nvim',
        opts = require 'plugins.opts.kanagawa',
    },
    { 'EdenEast/nightfox.nvim' },
    {
        'sam4llis/nvim-tundra',
        opts = {},
    },
    {
        'hoob3rt/lualine.nvim',
        opts = require 'plugins.opts.lualine',
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        lazy = true,
        event = 'BufReadPre',
        config = true,
    },
    {
        'luukvbaal/statuscol.nvim',
        lazy = true,
        event = 'VeryLazy',
        opts = function()
            require 'plugins.opts.statuscol'
        end,
    },
    {
        'uga-rosa/ccc.nvim',
        ft = { 'css', 'javascript', 'vim', 'html', 'ini', 'vue' },
        lazy = true,
        event = 'VeryLazy',
    },

    {
        'folke/which-key.nvim',
        lazy = true,
        event = 'VeryLazy',
        -- stylua ignore
        opts = {
            window = { margin = { 1, 10, 1, 10 } },
        },
    },
    { 'folke/trouble.nvim', lazy = true, event = 'VeryLazy', cmd = 'Trouble' },
    { 'folke/twilight.nvim', lazy = true, cmd = 'Twilight' },
    {
        'folke/edgy.nvim',
        event = 'VeryLazy',
        opts = require 'plugins.opts.edgy',
    },
    {
        'Pocco81/true-zen.nvim',
        opts = {},
        keys = {
            { '<leader>f', '<cmd>TZFocus<CR>' },
            { '<leader>z', '<cmd>TZAtaraxis<CR>' },
        },
    },
}
