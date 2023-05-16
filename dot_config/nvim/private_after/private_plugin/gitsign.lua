local m = require('builtins.maps').map
local attach_mappings = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        m(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
        if vim.wo.diff then
            return ']c'
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return '<Ignore>'
    end, { expr = true, desc = 'next hunk' })

    map('n', '[c', function()
        if vim.wo.diff then
            return '[c'
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return '<Ignore>'
    end, { expr = true, desc = 'prev hunk' })

    -- Actions
    map({ 'n', 'v' }, '<leader>gs', gs.stage_hunk, { desc = 'stage hunk' })
    map({ 'n', 'v' }, '<leader>gr', gs.reset_hunk, { desc = 'reset hunk' })
    map('n', '<leader>gS', gs.stage_buffer, { desc = 'stage buffer' })
    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
    map('n', '<leader>gR', gs.reset_buffer, { desc = 'reset buffer' })
    map('n', '<leader>gp', gs.preview_hunk, { desc = 'preview hunk' })
    map('n', '<leader>gb', function()
        gs.blame_line({ full = true })
    end, { desc = 'blame line' })
    map('n', '<leader>gd', gs.diffthis, { desc = 'diff this' })
    map('n', '<leader>gD', function()
        gs.diffthis('~')
    end, { desc = 'diff this home' })
    map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle deleted' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select hunk' })
end
require('gitsigns').setup({
    signs = {
        -- add = { text = "+" },
        -- add = { text = '█+' },
        -- change = { text = '█┆' },
        -- delete = { text = '█▁' },
        -- topdelete = { text = '█▔' },
        -- changedelete = { text = '█▟' },
        -- add = { text = "🟩" },
        -- change = { text = "🟦" },
        -- delete = { text = "🔻" },
        -- topdelete = { text = "🔺" },
        -- changedelete = { text = "🟥" },

        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '🔻' },
        topdelete = { text = '🔺' },
        untracked = { text = '┊' },
        changedelete = { text = '┃' },
    },
    on_attach = attach_mappings,
})
