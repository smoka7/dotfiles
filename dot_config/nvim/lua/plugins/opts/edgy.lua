return {
    options = {
        right = { size = 60 },
        left = { size = 40 },
    },
    animate = {
        enabled = false,
    },
    bottom = {
        {
            ft = 'toggleterm',
            size = { height = 0.4 },
            -- exclude floating windows
            filter = function(buf, win)
                return vim.api.nvim_win_get_config(win).relative == ''
            end,
        },
        {
            ft = 'lazyterm',
            title = 'LazyTerm',
            size = { height = 0.4 },
            filter = function(buf)
                return not vim.b[buf].lazyterm_cmd
            end,
        },
        { ft = 'Trouble', wo = { winbar = false } },
        { ft = 'qf', title = 'QuickFix' },
        {
            ft = 'help',
            wo = { winbar = false },
            size = { height = 0.4 },
            filter = function(buf)
                return vim.bo[buf].buftype == 'help'
            end,
        },
    },
    right = {
        { ft = 'spectre_panel', wo = { winbar = false } },
    },
    left = {
        -- Neo-tree filesystem always takes half the screen height
        {
            title = 'buffers',
            ft = 'neo-tree',
            filter = function(buf)
                return vim.b[buf].neo_tree_source == 'buffers'
            end,
            pinned = true,
            open = 'Neotree position=top buffers',
        },
        {
            title = 'files',
            ft = 'neo-tree',
            filter = function(buf)
                return vim.b[buf].neo_tree_source == 'filesystem'
            end,
            size = { height = 0.8 },
        },
        {
            title = 'symbols',
            ft = 'neo-tree',
            filter = function(buf)
                return vim.b[buf].neo_tree_source == 'document_symbols'
            end,
            open = 'Neotree position=right document_symbols',
        },
        {
            title = 'Git',
            ft = 'neo-tree',
            filter = function(buf)
                return vim.b[buf].neo_tree_source == 'git_status'
            end,
            open = 'Neotree position=right git_status',
        },
        -- any other neo-tree windows
        'neo-tree',
    },
}
