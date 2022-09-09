require("indent_blankline").setup({
	-- space_char_blankline = ' ',
	show_current_context = true,
	-- char_list = { "┃", "█" },
	char_list = { "." },
	use_treesitter = true,
	show_first_indent_level = true,
	filetype_exclude = { "NvimTree" },
})
