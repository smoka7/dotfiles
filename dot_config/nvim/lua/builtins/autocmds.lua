local colors = require 'ui.colors'
local autocmd = vim.api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup('vim', {
    clear = true,
})

autocmd('BufWritePost', {
    command = 'source %',
    pattern = '~/.config/nvim/{init,mappings,defaults}.lua',
    group = group,
})

autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank { higroup = 'lualine_a_normal', timeout = 200 }
    end,
    group = group,
})

autocmd('BufReadPost', {
    group = group,
    desc = 'go to last loc when opening a buffer',
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- autocmd('BufWritePre', {
--     callback = function()
--         if vim.o.modified then
--             vim.lsp.buf.format({ async = true, name = 'null-ls' })
--         end
--     end,
--     pattern = '*.vue',
--     group = id,
-- })

autocmd({ 'InsertLeave', 'WinEnter', 'CmdlineLeave' }, {
    desc = 'Show cursorline only in active window',
    pattern = '*',
    command = 'set cursorline',
    group = group,
})

autocmd({ 'InsertEnter', 'WinLeave', 'CmdlineEnter' }, {
    desc = 'Hide cursorline only in inactive window',
    pattern = '*',
    command = 'set nocursorline',
    group = group,
})

autocmd('OptionSet', {
    pattern = 'background',
    callback = function()
        if vim.v.option_new == 'light' then
            colors.lighten()
            return
        end
        colors.darken()
    end,
})

autocmd('TermOpen', {
    callback = function()
        local opts = { noremap = true }
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    end,
    pattern = 'term://*',
})

autocmd({ 'WinNew', 'VimResized' }, {
    callback = function()
        vim.cmd 'wincmd ='
    end,
    group = group,
})

autocmd({ 'BufWritePre' }, {
    desc = 'Auto create dir when saving a file, in case some intermediate directory does not exist',
    group = group,
    callback = function(event)
        if event.match:match '^%w%w+://' then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})
