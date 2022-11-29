local telescope = require("telescope")
telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		selection_caret = "  ",
		entry_prefix = "  ",
		dynamic_preview_title = true,
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.6,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.8,
			height = 0.8,
			preview_cutoff = 120,
		},
		file_ignore_patterns = { "node_modules" },
		path_display = { "truncate" },
		borderchars = {
			{ " ", " ", " ", " ", " ", " ", " ", " " },
			prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
			results = { " ", " ", " ", " ", " ", " ", " ", " " },
			preview = { " ", " ", " ", " ", " ", " ", " ", " " },
			-- { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
			-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},
		winblend = 0,
		-- border = {},
		color_devicons = true,
	},
})
telescope.load_extension("ui-select")
telescope.load_extension("refactoring")
