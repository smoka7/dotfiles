return {
    'ibhagwan/fzf-lua',
    lazy = true,
    event = 'VeryLazy',
    init = function()
        require('fzf-lua.providers.ui_select').register()
    end,
    keys = {
        { mode = 'n', '<Leader>p', '<cmd>FzfLua files<cr>', desc = 'fzf files' },
        { mode = 'n', '<Space>p', '<cmd>FzfLua grep<cr>', desc = 'fzf grep' },
        { mode = 'n', '<Space>c', '<cmd>FzfLua grep_cword<cr>', desc = 'grep current word' },
        { mode = 'n', '<C-p>', '<cmd>FzfLua grep_last<cr>', desc = 'grep last' },
        { mode = 'n', '<F1>', '<cmd>FzfLua help_tags<cr>', desc = 'help tags' },
    },
    opts = {
        winopts = {
            border = 'none',
        },
        lsp = {
            cwd_only = true, -- LSP/diagnostics for cwd only?
        },
        previewers = {
            builtin = { treesitter = { disable = { 'vimdoc', 'help' } } },
        },
        git = {
            status = {
                cmd = 'git status -s',
                --preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
            },
        },
    },
}
