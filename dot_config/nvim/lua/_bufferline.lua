local cl = require("colors")
local map = require("utils").map
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
		-- background = { guifg = green, guibg = green },
		-- buffer_visible = { guifg = gray, guibg = "NONE" },
		-- close_button = { guifg = gray, guibg = "NONE" },
		-- close_button_visible = { guifg = white, guibg = "NONE" },
		-- duplicate_visible = { guifg = gray, guibg = "NONE" },
		-- modified = { guifg = orange, guibg = "NONE" },
		-- modified_visible = { guifg = orange, guibg = "NONE" },
		-- separator = { guifg = gray, guibg = "NONE" },
		-- separator_visible = { guifg = black, guibg = green },
		-- tab = { guifg = black, guibg = white },
		-- tab_close = { guifg = orange, guibg = "NONE" },

		fill = { guibg = "NONE" },
		buffer_selected = { guifg = cl.black, guibg = cl.green_l },
		close_button_selected = { guifg = cl.black, guibg = cl.green_l },
		duplicate_selected = { guifg = cl.black, guibg = cl.green_l },
		indicator_selected = { guifg = cl.black, guibg = cl.green_l },
		modified_selected = { guifg = cl.black, guibg = cl.green_l },
		separator_selected = { guifg = "NONE", guibg = "NONE" },
		tab_selected = { guifg = cl.black, guibg = cl.green_l },
	},
})
local opt = { silent = true }
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
		relativenumber = false,
	},
})
