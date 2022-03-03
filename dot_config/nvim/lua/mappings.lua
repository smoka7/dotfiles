local wk = require("which-key")

wk.register({
	name = "file",
	["<A-h>"] = { "<C-w>h" ,"left"},
	["<A-j>"] = { "<C-w>j" },
	["<A-k>"] = { "<C-w>k" },
	["<A-l>"] = { "<C-w>l" },
	["<A-Left>"] = { "<C-w>h" },
	["<A-Down>"] = { "<C-w>j" },
	["<A-UP>"] = { "<C-w>k" },
	["<A-Right>"] = { "<C-w>l" },
})
