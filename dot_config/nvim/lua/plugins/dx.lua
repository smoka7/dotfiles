return {
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {
            labels = 'asdfghjklqwertyuiopzxcvbnm',
            search = {
                incremental = false,
                mode = 'fuzzy',
                enabled = false,
                exclude = {
                    'noice',
                    'notify',
                    'cmp_menu',
                    function(win)
                        return not vim.api.nvim_win_get_config(win).focusable
                    end,
                },
            },
            jump = { nohlsearch = true, autojump = true },
            highlight = { label = { style = 'inline', before = true, after = false } },
            modes = {
                --search = { enabled = false },
                char = {
                    enabled = false,
                    jump_labels = function()
                        return true
                    end,
                    keys = { 'f', 'F' },
                },
            },
        },
        keys = {
            {
                'm',
                mode = { 'o', 'x' },
                function()
                    require('flash').treesitter()
                end,
            },
        },
    },

    {
        dir = '~/gits/multicursors',
        event = 'VeryLazy',
        dependencies = {
            'smoka7/hydra.nvim',
        },
        --opts = function()
        -- local N = require 'multicursors.normal_mode'
        -- return {
        --     normal_keys = {
        --         ['b'] = { method = N.clear_others, desc = 'Clear others' },
        --     },
        -- }
        --end,
        opts = {
            --updatetime = 1000,
            DEBUG_MODE = true,
        },
        keys = {
            {
                '<Leader>j',
                '<cmd>MCstart<cr>',
                desc = 'Create a selection for word under the cursor',
            },
        },
    },
    {
        'smoka7/hydra.nvim',
        event = 'VeryLazy',
        lazy = true,
        config = function()
            require 'plugins.opts.hydra'
        end,
    },

    {
        'smoka7/hop.nvim',
        dev = true,
        --cond = true,
        config = function()
            require 'plugins.opts.hop'
        end,
    },
    { 'famiu/bufdelete.nvim', lazy = true, cmd = 'Bdelete' },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'kyazdani42/nvim-web-devicons' },

        init = function()
            vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
        end,
        config = function()
            require 'plugins.opts.neo-tree'
        end,
        event = 'VeryLazy',
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        lazy = true,
    },
    { 'sindrets/diffview.nvim' },
    {
        'TimUntersberger/neogit',
        lazy = true,
        cmd = 'Neogit',
        config = true,
    },

    {
        'akinsho/toggleterm.nvim',
        lazy = true,
        cmd = 'ToggleTerm',
        opts = {
            direction = 'vertical',
            highlights = {},
            shade_terminals = false,
        },
    },
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = { options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' } },
    -- stylua: ignore
    keys = {
      { '<leader>ss', function() require('persistence').load() end, desc = 'Restore Session' },
      { '<leader>sl', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
      { '<leader>sd', function() require('persistence').stop() end, desc = 'Don\'t Save Current Session' },
    },
    },

    { 'mg979/vim-visual-multi', event = 'VeryLazy', lazy = true },
    { 'tpope/vim-repeat' },
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        opts = {},
    },
    { 'tpope/vim-surround', event = 'VeryLazy', lazy = true, cond = false },
}
