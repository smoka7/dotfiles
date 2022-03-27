local map = require("utils").map
require("hop").setup({})
require("Comment").setup({})

require("gomove").setup({
	map_smart = true,
	reindent = true,
	undojoin = true,
	move_past_end_col = false,
	ignore_indent_lh_dup = true,
})

require("which-key").setup({
	plugins = {
		spelling = {
			enabled = true,
			suggestions = 20,
		},
	},
})

require("neogen").setup({
	enabled = true,
})

--
-- easy access to cmd mode
map("n", ";", ":")

local cmdnf = function(dir, inclusive)
	return "<cmd>lua package.loaded.hop.hint_char1({ direction = require'hop.hint'.HintDirection."
		.. dir
		.. " , current_line_only = false, inclusive_jump = "
		.. inclusive
		.. "  })<cr>"
end

map("n", "f", cmdnf("AFTER_CURSOR", "true"), {})
map("n", "F", cmdnf("BEFORE_CURSOR", "true"), {})
map("o", "f", cmdnf("AFTER_CURSOR", "false"), {})
map("o", "F", cmdnf("BEFORE_CURSOR", "false"), {})

local opts = { noremap = true, silent = true, expr = true }
local cmd =
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").toggle_linewise_count()<CR>']]
local icmd =
	[[v:count == 0 ? '<Esc><CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$i' : '<Esc><CMD>lua require("Comment.api").toggle_linewise_count()<CR>i']]

map({ "v", "n" }, "<C-/>", cmd, opts)
map("i", "<C-/>", icmd, opts)
map({ "v", "n" }, "", cmd, opts)
map("i", "", icmd, opts)

opts = { noremap = true, silent = true }
map("n", "<Leader>n", function()
	package.loaded.neogen.generate()
end, opts)

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

--
-- -- lsp and file navigation
map("n", "<C-p>", ":Telescope live_grep<cr>")
map("n", "<Leader>e", ":NvimTreeToggle<cr>")
map("n", "<Leader>f", ":Neoformat<cr>")
map("n", "<Leader>hh", ":Telescope help_tags<cr>")
map("n", "<Leader>p", ":Telescope find_files<cr>")
map("n", "<Leader>s", ":Telescope lsp_document_symbols<cr>")
map("n", "<Leader>u", ":UndotreeToggle<cr>")

--
-- -- maping for gui
map({ "i" }, "<C-\\>", "<C-W>")
map({ "i" }, "<C-BS>", "<C-W>")
map({ "i" }, "<C-v>", '<Left><C-o>"+p')
map({ "n" }, "<C-v>", '"+p')
-- map({ "n" }, "<C-s>", "ysiw")

--
-- -- delete and change without clipboard
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "C", '"_C')
-- map({ "n", "v" }, "d", '"_d')

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
map({ "n", "i" }, "zz", ":w<cr>")
map({ "n" }, "qq", ":q!<cr>")
map({ "n" }, "<Leader>q", ":Bdelete!<cr>")
map({ "n" }, "<Leader>w", ":q<cr>")
map({ "n" }, "<Leader>c", ":close<cr>")
vim.cmd([[
if !exists(":W")
    command W w suda://%
endif
]])

--
-- -- tabs
map({ "n" }, "<Leader>tn", ":tabnew<CR>")
map({ "n" }, "<Leader>tk", ":tabnext<CR>")
map({ "n" }, "<Leader>tl", ":tablast<CR>")
map({ "n" }, "<Leader>td", ":tabclose<CR>")
map({ "n" }, "<S-Tab>", ":tabnext<CR>")

--
-- -- test functions
map({ "n" }, "<Space>tn", ":TestNearest<CR>")
map({ "n" }, "<Space>tl", ":TestLast<CR>")
map({ "n" }, "<Space>tf", ":TestFile<CR>")
map({ "n" }, "<Space>tv", ":TestVisit<CR>")

--
-- -- moving lines up and down
map({ "i" }, "<S-Up>", "<C-o><Plug>GoNSMUp")
map({ "i" }, "<S-Down>", "<C-o><Plug>GoNSMDown")
map({ "n" }, "<S-Up>", "<Plug>GoNSMUp")
map({ "n" }, "<S-Down>", "<Plug>GoNSMDown")
map({ "x" }, "<S-Up>", "<Plug>GoVSMUp")
map({ "x" }, "<S-Down>", "<Plug>GoVSMDown")
map({ "x" }, "<S-Left>", "<Plug>GoVSMLeft")
map({ "x" }, "<S-Right>", "<Plug>GoVSMRight")

--
-- -- spell check
map({ "n" }, "<Space>u", ":set spell!<CR>")
