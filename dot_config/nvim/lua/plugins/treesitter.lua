return {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPre',
    config = function()
        require 'plugins.opts.treesitter'
    end,
    dependencies = {
        {
            'echasnovski/mini.nvim',
            version = false,
            event = 'VeryLazy',
            config = function()
                require 'plugins.opts.starter'
                require('mini.indentscope').setup {
                    draw = {},
                    symbol = '.',
                }
            end,
        },

        { 'RRethy/nvim-treesitter-textsubjects' },
        {
            'danymat/neogen',
            config = true,
            keys = { { '<leader>n', '<cmd>Neogen<cr>' } },
        },
        {
            'mizlan/iswap.nvim',
            opts = {
                autoswap = true,
            },
        },
        { 'nvim-treesitter/nvim-treesitter-context' },
        { 'nvim-treesitter/nvim-treesitter-refactor' },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { 'theHamsta/nvim-treesitter-pairs' },
        {
            'numToStr/Comment.nvim',
            dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
            config = function()
                require 'plugins.opts.comment'
            end,
        },
    },
}
