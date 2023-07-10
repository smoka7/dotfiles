local util = require 'builtins.maps'
local map = util.map
local normal = util.nmap
local insert = util.imap
local inormal = util.inmap
local cmd = util.cmd

local dismiss = function()
    vim.cmd.nohlsearch()

    if vim.g.vscode or vim.g.neovide then
        print ''
        return
    end
    vim.cmd 'Noice dismiss'
end
normal('<Esc>', dismiss, { desc = 'dissmiss' })
normal('i', function()
    dismiss()
    return 'i'
end, { expr = true })

--
-- better up/down
--nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

normal('gw', '*N', { desc = '' })
map('x', 'gw', '*N', { desc = 'highlight current word' })

normal('<leader>d', '*``cgn', { desc = 'edit current word' })
normal('<leader>x', ':%s/', { desc = 'search and replace in current buffer' })

map({ 'v' }, '<leader>x', "<esc>:'<,'>s/", { desc = 'search and replace in current selection' })

--
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
normal('n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
normal('N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

map('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })
map('x', '*', [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
map('x', '#', [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])
--
-- -- center on next
normal('n', 'nzzzv', { desc = 'next search and center' })
normal('N', 'Nzzzv', { desc = 'prev search and center' })

----
-- easy access to cmd mode
--
map({ 'n', 'v' }, ';', ':', { desc = 'cmd line mode' })

--nmap( "<Left>", "<Nop>")
--nmap( "<Right>", "<Nop>")
--nmap( "<Up>", "<Nop>")
--nmap( "<Down>", "<Nop>")

normal('<Home>', '^', { desc = '' })
insert('<Home>', '<C-o>^')
normal('<C-Left>', 'b', { desc = 'b' })
normal('<C-Right>', 'w', { desc = 'w' })

--
-- -- split and move between them
normal('<Leader>v', vim.cmd.vsplit, { desc = 'splitv' })
normal('<Leader>h', vim.cmd.split, { desc = 'splith' })
-- inmap( "<A-h>", "<C-w>h")
-- inmap( "<A-j>", "<C-w>j")
-- inmap( "<A-k>", "<C-w>k")
-- inmap( "<A-l>", "<C-w>l")
inormal('<A-Left>', '<C-w>h')
inormal('<A-Down>', '<C-w>j')
inormal('<A-UP>', '<C-w>k')
inormal('<A-Right>', '<C-w>l')

normal('<Leader>u', cmd 'UndotreeToggle', { desc = 'undo tree' })

--
-- -- delete and change without clipboard
map({ 'n', 'v' }, 'c', '"_c')
map({ 'n', 'v' }, 'C', '"_C')

normal('dd', function()
    if vim.api.nvim_get_current_line() == '' then
        return '"_dd'
    end
    return 'dd'
end, { expr = true })

-- map({ "n", "v" }, "d", '"_d')

--
-- reindent continuously
map('v', '<', '<gv')
map('v', '>', '>gv')
map('n', '<', '<<')
map('n', '>', '>>')
--
-- -- copy to plusregister
map({ 'n', 'x' }, 'gy', '"+y')
insert('<C-y>', '<C-o>"+yy')

--
-- -- save file
normal('zz', vim.cmd.w, { desc = 'write' })
map({ 'i', 'v', 'n', 's' }, '<C-s>', vim.cmd.w, { desc = 'Save file' })
insert('<C-BS>', '<C-W>')
insert('<C-v>', '<C-r>+')
insert('<C-S-v>', '"+p')

normal('qq', vim.cmd.wq, { desc = 'write and quite' })
normal('<Leader>q', vim.cmd.Bdelete, { desc = 'bdelete' })
normal('<Leader>c', vim.cmd.close, { desc = 'close' })

--
-- -- tabs
normal('<Leader>tn', vim.cmd.tabnew, { desc = 'tabnew' })
normal('<Leader>to', vim.cmd.tabonly, { desc = 'tabonly' })
normal('<Leader>td', vim.cmd.tabclose, { desc = 'tabclose' })

normal(']t', vim.cmd.tabnext, { desc = 'tabnext' })
normal('[t', vim.cmd.tabprevious, { desc = 'tabprev' })

normal(']b', vim.cmd.bnext, { desc = 'bnext' })
normal('[b', vim.cmd.bprevious, { desc = 'bprev' })

normal('<S-Tab>', cmd 'Telescope buffers', { desc = 'Telescope buffers' })
normal('<Tab>', vim.cmd.bnext, { desc = 'bnext' })

--
-- -- spell check
normal('<Space>s', cmd 'set spell!', { desc = 'spellcheck' })
--
-- -- indention
normal('<Space>i', function()
    if vim.opt.list._value then
        vim.opt.list = false
        return
    end
    vim.opt.list = true
end, { desc = 'show indention' })

normal('<space>h', cmd 'source %', { desc = 'source this' })
