local util = require('builtins.maps')
local map = util.map
local nmap = util.nmap
local imap = util.imap
local inmap = util.inmap

nmap('i', function()
    vim.cmd.nohlsearch()
    print('')
    return 'i'
end, { expr = true })

nmap('<Esc>', function()
    vim.cmd.nohlsearch()

    if vim.g.vscode or vim.g.neovide then
        print('')
        return
    end
    vim.cmd([[Noice dismiss]])
end)

--
-- better up/down
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

nmap('gw', '*N')
map('x', 'gw', '*N')

--
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nmap('n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
nmap('N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

map('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })
map('x', '*', [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
map('x', '#', [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])
--
-- -- center on next
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

----
-- easy access to cmd mode
--
map({ 'n', 'v' }, ';', ':')

--nmap( "<Left>", "<Nop>")
--nmap( "<Right>", "<Nop>")
--nmap( "<Up>", "<Nop>")
--nmap( "<Down>", "<Nop>")

nmap('<Home>', '^')
imap('<Home>', '<C-o>^')
nmap('<C-Left>', 'b')
nmap('<C-Right>', 'w')

--
-- -- split and move between them
nmap('<Leader>v', ':vsplit<cr>')
-- inmap( "<A-h>", "<C-w>h")
-- inmap( "<A-j>", "<C-w>j")
-- inmap( "<A-k>", "<C-w>k")
-- inmap( "<A-l>", "<C-w>l")
inmap('<A-Left>', '<C-w>h')
inmap('<A-Down>', '<C-w>j')
inmap('<A-UP>', '<C-w>k')
inmap('<A-Right>', '<C-w>l')

nmap('<Leader>u', ':UndotreeToggle<cr>')

--
-- -- delete and change without clipboard
map({ 'n', 'v' }, 'c', '"_c')
nmap('C', '"_C')

nmap('dd', function()
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

--
-- -- copy to plusregister
map({ 'n', 'x' }, 'gy', '"+y')

imap('<C-y>', '<C-o>"+yy')

--
-- -- save file
nmap('zz', ':w<cr>')
nmap('qq', ':wq<cr>')
nmap('<Leader>q', ':Bdelete<cr>')
nmap('<Leader>c', ':close<cr>')

--
-- -- tabs
nmap('<Leader>tn', ':tabnew<CR>')
nmap('<Leader>to', ':tabonly<CR>')
nmap('<Leader>td', ':tabclose<CR>')

nmap(']t', ':tabnext<CR>')
nmap('[t', ':tabprevious<CR>')

nmap(']b', ':bnext<CR>')
nmap('[b', ':bprevious<CR>')

nmap('<Tab>', ':bnext<CR>')
nmap('<S-Tab>', ':bprevious<CR>')
--
-- -- spell check
nmap('<Space>u', ':set spell!<CR>')
--
-- -- indention
nmap('<Space>i', function()
    if vim.opt.list._value then
        vim.opt.list = false
        return
    end
    vim.opt.list = true
end)
