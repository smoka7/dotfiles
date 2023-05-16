local autocmd = vim.api.nvim_create_autocmd
local id = vim.api.nvim_create_augroup('vim', {
    clear = true,
})

autocmd('BufWritePost', {
    command = 'source %',
    pattern = '{init,mappings,defaults}.lua',
    group = id,
})

autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'lualine_a_normal', timeout = 200 })
    end,
    group = id,
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

vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter', 'CmdlineLeave' }, {
    desc = 'Show cursorline only in active window',
    pattern = '*',
    command = 'set cursorline',
    group = id,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave', 'CmdlineEnter' }, {
    desc = 'Hide cursorline only in inactive window',
    pattern = '*',
    command = 'set nocursorline',
    group = id,
})

-- autocmd("BufEnter", {
-- 	command = "source <afile>",
-- 	pattern = "plugins.lua",
-- 	group = id,
-- })
--
-- autocmd("BufWritePost", {
--         command = "source <afile> | PackerCompile",
--         pattern = "plugins.lua",
--         group = id,
-- })
autocmd('OptionSet', {
    pattern = 'background',
    callback = function()
        vim.cmd('Catppuccin ' .. (vim.v.option_new == 'light' and 'latte' or 'frappe'))
    end,
})

autocmd('TermOpen', {
    callback = function()
        local opts = { noremap = true }
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    end,
    pattern = 'term://*',
})

autocmd('VimResized', {
    callback = function()
        vim.cmd('wincmd =')
    end,
    group = id,
})

-- autocmd("ModeChanged", {
-- 	callback = function()
-- 		local cmd_type = vim.fn.getcmdtype()
-- 		if cmd_type == "/" or cmd_type == "?" then
-- 			vim.opt.hlsearch = true
-- 			return
-- 		end
-- 		vim.opt.hlsearch = false
-- 	end,
-- 	group = id,
-- })
