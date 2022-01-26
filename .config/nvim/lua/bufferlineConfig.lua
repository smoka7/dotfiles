local black = "#1b222d"
local green = "#c0ca33"
-- local gray = "#757575"
-- local white = "#f1faee"
-- local orange = "#f4511e"

require("bufferline").setup({
	options = {
		offsets = { { filetype = "nvimtree", text = "", padding = 1 } },
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "thin",
		-- mappings = "true"
	},
	highlights = {
		-- background = { guifg = black, guibg = "NONE" },
		-- buffer_visible = { guifg = gray, guibg = "NONE" },
		-- close_button = { guifg = gray, guibg = "NONE" },
		-- close_button_visible = { guifg = white, guibg = "NONE" },
		-- duplicate_visible = { guifg = gray, guibg = "NONE" },
		-- fill = { guifg = gray, guibg = "NONE" },
		-- modified = { guifg = orange, guibg = "NONE" },
		-- modified_visible = { guifg = orange, guibg = "NONE" },
		-- separator = { guifg = gray, guibg = "NONE" },
		-- separator_visible = { guifg = black, guibg = green },
		-- tab = { guifg = black, guibg = white },
		-- tab_close = { guifg = orange, guibg = "NONE" },
		buffer_selected = { guifg = black, guibg = green, gui = "bold" },
		close_button_selected = { guifg = black, guibg = green },
		duplicate_selected = { guifg = black, guibg = green, gui = "bold" },
		indicator_selected = { guifg = black, guibg = green },
		modified_selected = { guifg = black, guibg = green },
		separator_selected = { guifg = black, guibg = green },
		tab_selected = { guifg = black, guibg = green },
	},
})
local opt = { silent = true }
local map = vim.api.nvim_set_keymap
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
-- map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
require("nvim-tree").setup({
	hijack_cursor = true,
	update_cwd = true,
	diagnostics = {
		enable = true,
	},
	filters = {
		custom = { ".git", "node_modules", ".cache", "vendor" },
	},
	view = {
		auto_resize = true,
		relativenumber = true,
	},
})
