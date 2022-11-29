require("which-key").setup({
	plugins = {
		spelling = {
			enabled = true,
			suggestions = 20,
		},
	},
	window = {
		position = "bottom",
		margin = { 2, 2, 2, 2 },
	},
	show_help = false,
	show_keys = false,
})
