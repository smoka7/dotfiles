require("neo-tree").setup({
	close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "single",
	enable_git_status = true,
	enable_diagnostics = true,
	renderers = {
		message = {
			{ "indent", with_markers = false },
			{ "name", highlight = "NeoTreeMessage" },
		},
	},
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			with_markers = false,
			highlight = "NeoTreeIndentMarker",
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = " ",
			expander_expanded = " ",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = " ",
			folder_open = " ",
			folder_empty = "ﰊ ",
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		position = "left",
		width = 40,
	},
	nesting_rules = {},
	filesystem = {
		follow_current_file = true,
		group_empty_dirs = false,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
	},
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {},
	},
})
