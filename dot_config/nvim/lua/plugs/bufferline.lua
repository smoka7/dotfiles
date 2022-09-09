require("bufferline").setup({
	options = {
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		show_buffer_close_icons = false,
		separator_style = "thin",
	},
      highlights = require("catppuccin.groups.integrations.bufferline").get()
})

vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLinePick<CR>")
