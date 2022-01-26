local lualine = require("lualine")
-- Color table for highlights
local colors = {
	bg = "#2B2D42",
	fg = "#EDF2F4",
	yellow = "#ECBE7B",
	green = "#98be65",
	cyan = "#008080",
	blue = "#51afef",
	red = "#F46778",
}
local gps = require("nvim-gps")
gps.setup({ disable_icons = true })

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}
-- Config
local config = {
	options = {
		theme = "onedark",
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		icons_enabled = 1, -- displays icons in alongside component
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			{
				"branch",
				icon = " 🥦",
				condition = conditions.check_git_workspace,
				color = { fg = colors.green, bg = "Normal" },
			},
			{
				"diff",
				colored = true, -- displays diff status in color if set to true
				color = { bg = colors.bg },
				color_added = colors.green, -- changes diff's added foreground color
				color_modified = colors.blue, -- changes diff's modified foreground color
				color_removed = colors.red, -- changes diff's removed foreground color
				symbols = { added = "+ ", modified = "~ ", removed = "- " },
			},
		},
		lualine_c = { "filename", { gps.get_location, cond = gps.is_available } },
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				color = { bg = "Normal" },
				sections = { "error", "warn", "info", "hint" },
				symbols = { error = "⛔ ", warn = "🚦 ", info = "🚩 ", hint = "💡 " },
				-- symbols = { error = "✘ ", warn = "⚠ ", info = "⚑ ", hint = "✰ " },
				color_error = colors.red,
				color_warn = colors.yellow,
				color_info = colors.cyan,
				color_hint = colors.blue,
			},
			"encoding",
			"fileformat",
			{ "filetype", colored = true },
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
}
lualine.setup(config)
