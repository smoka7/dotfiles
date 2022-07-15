require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"css",
		"fish",
		"go",
		"gomod",
		"gowork",
		"help",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"jsonc",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"php",
		"phpdoc",
		"query",
		"rasi",
		"regex",
		"rust",
		"scheme",
		"scss",
		"teal",
		"todotxt",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vue",
		"yaml",
	},
	refactor = {
		smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
	},

	highlight = {
		enable = true,
		custom_captures = {},
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "gri",
			node_decremental = "grd",
		},
	},

	indent = {
		enable = true,
	},

	textobjects = {
		enable = true,
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},

		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
			goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
			goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
			goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
		},
		swap = {
			enable = true,
			swap_next = { ["<leader>a"] = "@parameter.inner" },
			swap_previous = { ["<leader>A"] = "@parameter.inner" },
		},
	},
	pairs = {
		enable = true,
		disable = {},
		highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
		highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
		goto_right_end = false, -- whether to go to the end of the right partner or the beginning
		fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
		keymaps = {
			goto_partner = "%",
			delete_balanced = "X",
		},
		delete_balanced = {
			only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
			fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
			longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
			-- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	textsubjects = {
		enable = true,
		prev_selection = ";", -- (Optional) keymap to select the previous selection
		keymaps = {
			["<cr>"] = "textsubjects-smart",
			["."] = "textsubjects-container-outer",
			[","] = "textsubjects-container-inner",
		},
	},
})
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		default = {
			"class",
			"function",
			"method",
			"for", -- These won't appear in the context
			-- 'while',
			"if",
			"switch",
			"case",
		},
	},
})

require("nvim-autopairs").setup({
	check_ts = true,
	enable_check_bracket_line = true,
	ignored_next_char = "[%w%.,->]", -- will ignore alphanumeric and `.` symbol
	map_c_w = true,
})
local opts = { noremap = true, silent = true }
-- Syntax Tree Surfer V2 Mappings
vim.keymap.set("n", "vD", "<cmd>STSSwapCurrentNodeNextNormal<cr>", opts)
vim.keymap.set("n", "vU", "<cmd>STSSwapCurrentNodePrevNormal<cr>", opts)
vim.keymap.set("n", "vd", "<cmd>STSSwapDownNormal<cr>", opts)
vim.keymap.set("n", "vu", "<cmd>STSSwapUpNormal<cr>", opts)
local sts = require("syntax-tree-surfer")
-- Setup Function example:
-- These are the default options:
sts.setup({
	highlight_group = "HopNextKey",
	disable_no_instance_found_report = false,
	default_desired_types = {
		"function",
		"method",
		"function_definition",
		"if_statement",
		"else_clause",
		"else_statement",
		"elseif_statement",
		"for_statement",
		"while_statement",
		"switch_statement",
	},
	left_hand_side = "fdsawervcxqtzb",
	right_hand_side = "jkl;oiu.,mpy/n",
	icon_dictionary = {
		["if_statement"] = "",
		["else_clause"] = "",
		["else_statement"] = "",
		["elseif_statement"] = "",
		["for_statement"] = "ﭜ",
		["while_statement"] = "ﯩ",
		["switch_statement"] = "ﳟ",
		["function"] = "",
		["function_definition"] = "",
		["variable_declaration"] = "",
	},
})
