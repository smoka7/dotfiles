local lualine = require("lualine")
local colorList = require("colors")
local conditions = require("utils")
local gps = require("nvim-gps")
gps.setup({ disable_icons = true })
local function returnmod()
	local mode = require("lualine.utils.mode").get_mode()
	local mode_color = {
		n = colorList.blue,
		i = colorList.green,
		v = colorList.yellow,
		[""] = colorList.orange,
		V = colorList.orange,
		c = colorList.magenta,
		no = colorList.red,
		s = colorList.orange,
		S = colorList.orange,
		[""] = colorList.orange,
		ic = colorList.yellow,
		R = colorList.violet,
		Rv = colorList.violet,
		cv = colorList.red,
		ce = colorList.red,
		r = colorList.red,
		rm = colorList.cyan,
		["r?"] = colorList.cyan,
		["!"] = colorList.red,
		t = colorList.yellow,
	}
	vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colorList.bg)
	return "  " .. mode
end

local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	if searchcount.total == 0 then
		return ""
	end
	return "? " .. searchcount.current .. "/" .. searchcount.total
end

local config = {
	options = {
		theme = "onedark",
		component_separators = "",
		section_separators = "",
		-- component_separators = { left = "\\", right = "\\" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		icons_enabled = 1,
	},
	sections = {
		lualine_a = {
			{
				function()
					return returnmod()
				end,
				color = "LualineMode",
				padding = { right = 1 },
			},
		},
		lualine_b = {
			{
				"filename",
				cond = conditions.buffer_not_empty,
				color = { bg = colorList.shade1 },
			},
			{
				"branch",
				-- icon = " 🥦",
				icon = "",
				condition = conditions.check_git_workspace,
				color = { fg = colorList.blue, bg = colorList.shade2 },
			},
		},
		lualine_c = {
			{
				"diff",
				condition = conditions.check_git_workspace and conditions.hide_in_width,
				colored = true,
				color = { bg = colorList.shade3 },
				diff_color = {
					added = { fg = colorList.green },
					modified = { fg = colorList.blue },
					removed = { fg = colorList.red },
				},
				symbols = { added = " ", modified = "柳", removed = " " },
			},
			{
				gps.get_location,
				cond = gps.is_available,
				condition = conditions.buffer_not_empty,
				color = { bg = colorList.shade3 },
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				color = { bg = "Normal" },
				sections = { "error", "warn", "info", "hint" },
				symbols = { error = "⛔ ", warn = "🚦 ", info = "🚩 ", hint = "💡 " },
				-- symbols = { error = "✘ ", warn = "⚠ ", info = "⚑ ", hint = "✰ " },
				color_error = { fg = colorList.red },
				color_warn = { fg = colorList.yellow },
				color_info = { fg = colorList.cyan },
				color_hint = { fg = colorList.green },
			},
			{
				function()
					return search_result()
				end,
				color = { fg = colorList.yellow },
			},
			{
				"fileformat",
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
			},
			{
				"filesize",
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
				color = { bg = colorList.shade3 },
			},
		},
		lualine_y = {
			{
				"encoding",
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
				color = { bg = colorList.shade2 },
			},
			{ "filetype", colored = true },
		},
		lualine_z = {
			{ "progress", color = { fg = colorList.fg, bg = colorList.shade1 }, padding = 0 },
			{ "location", color = "LualineMode" },
		},
	},
}
lualine.setup(config)
