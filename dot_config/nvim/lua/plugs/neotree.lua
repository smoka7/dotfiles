local config = {
	close_if_last_window = true,
	default_component_configs = {
		indent = {
			with_markers = false,
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
		},
		git_status = {
			symbols = {
				added = "✚",
				deleted = "✖",
				modified = "",
				renamed = "",
				untracked = "t",
				ignored = "i",
				unstaged = "u",
				staged = "s",
				conflict = "c",
			},
			align = "right",
		},
	},
	filesystem = {
		follow_current_file = true,
	},
}

require("neo-tree").setup(config)
