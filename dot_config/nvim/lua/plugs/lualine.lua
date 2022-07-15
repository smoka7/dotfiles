local lualine = require("lualine")
local colorList = require("ui.colors")
local conditions = require("utils")

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
	return "🔎 " .. searchcount.current .. "/" .. searchcount.total
end

local config = {
	options = {
		theme = colorList.celeste,
		globalstatus = true,
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
				color = "lualine_a_insert",
				function()
					return "  "
				end,
				padding = { left = 0 },
			},
			{
				"mode",
			},
		},
		lualine_b = {
			{
				"filename",
				symbols = {
					modified = " +", -- Text to show when the file is modified.
					readonly = " -", -- Text to show when the file is non-modifiable or readonly.
				},
				cond = conditions.buffer_not_empty,
			},
			{
				"branch",
				icon = " 🥦",
				-- icon = '',
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
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				-- color = { bg = "Normal" },
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
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
			{ "progress", color = { fg = colorList.fg, bg = colorList.shade1 }, padding = 1 },
			{ "location", color = { fg = colorList.fg, bg = colorList.shade3 } },
		},
	},
}
lualine.setup(config)
