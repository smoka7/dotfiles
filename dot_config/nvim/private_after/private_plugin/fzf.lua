local fzf = require('fzf-lua')
fzf.setup({
    winopts = {
        border = 'none',
    },
    lsp = {
        cwd_only = true, -- LSP/diagnostics for cwd only?
    },
    git = {
        status = {
            cmd = 'git status -s',
            --preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
        },
    },
})
vim.keymap.set('n', '<Leader>p', '<cmd>FzfLua files<cr>', { desc = 'fzf files' })
vim.keymap.set('n', '<Space>p', '<cmd>FzfLua grep<cr>', { desc = 'fzf grep' })
vim.keymap.set('n', '<Space>c', '<cmd>FzfLua grep_cword<cr>', { desc = 'grep current word' })
vim.keymap.set('n', '<C-p>', '<cmd>FzfLua grep_last<cr>', { desc = 'grep last' })
vim.keymap.set('n', '<F1>', '<cmd>FzfLua help_tags<cr>', { desc = 'help tags' })
