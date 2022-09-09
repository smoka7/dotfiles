vim.g.mapleader = "\\"

local map = require("utils").map

require("neogen").setup({
	enabled = true,
})

map("n", "<Leader>n", function()
	package.loaded.neogen.generate()
end)
--
-- easy access to cmd mode
--
map({ "n", "x" }, ";", ":")
-- map("n", "<Left>", "<Nop>")
-- map("n", "<Right>", "<Nop>")
-- map("n", "<Up>", "<Nop>")
-- map("n", "<Down>", "<Nop>")

map("n", "<Home>", "^")
map("i", "<Home>", "<Esc>^i")
map("n", "<C-Left>", "b")
map("n", "<C-Right>", "w")

--
-- -- split and move between them
map({ "n" }, "<Leader>v", ":vsplit<cr>")
-- map({ "i", "n" }, "<A-h>", "<C-w>h")
-- map({ "i", "n" }, "<A-j>", "<C-w>j")
-- map({ "i", "n" }, "<A-k>", "<C-w>k")
-- map({ "i", "n" }, "<A-l>", "<C-w>l")
map({ "i", "n" }, "<A-Left>", "<C-w>h")
map({ "i", "n" }, "<A-Down>", "<C-w>j")
map({ "i", "n" }, "<A-UP>", "<C-w>k")
map({ "i", "n" }, "<A-Right>", "<C-w>l")

map("t", "jk", "<C-\\><C-n>")

map("n", "<Space>e", ":NeoTreeRevealToggle<cr>")
map("n", "<Leader>u", ":UndotreeToggle<cr>")

--
-- -- delete and change without clipboard
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "c", '"_c')

map("n", "dd", function()
	local line = vim.api.nvim_get_current_line()
	if line == "" then
		vim.pretty_print("ss")
		return '"_dd'
	end
	return "dd"
end, { expr = true })

-- map({ "n", "v" }, "d", '"_d')

--
-- reindent continuously
map({ "v" }, "<", "<gv")
map({ "v" }, ">", ">gv")

--
-- -- copy to plusregister
map({ "n", "v" }, "<Leader>y", '"+y')
map("i", "<C-y>", '<C-o>"+yy')

--
-- -- center on next
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

--
-- -- save file
map({ "n" }, "zz", ":w<cr>")
map({ "n" }, "qq", ":q!<cr>")
map({ "n" }, "<Leader>q", ":Bdelete<cr>")
map({ "n" }, "<Leader>c", ":close<cr>")
vim.cmd([[
if !exists(":W")
    command W w suda://%
endif
]])

--
-- -- tabs
map({ "n" }, "<Leader>tn", ":tabnew<CR>")
map({ "n" }, "<Leader>td", ":tabclose<CR>")

map({ "n" }, "]t", ":tabnext<CR>")
map({ "n" }, "[t", ":tabprevious<CR>")

map({ "n" }, "]b", ":bnext<CR>")
map({ "n" }, "[b", ":bprevious<CR>")

--
-- -- spell check
map({ "n" }, "<Space>u", ":set spell!<CR>")
--
-- -- indention
map({ "n" }, "<Space>i", function()
	if vim.opt.list._value then
		vim.opt.list = false
		return
	end
	vim.opt.list = true
end)
