local colorList = require("catppuccin.palettes").get_palette() -- fetch colors from palette
local lualine = require("lualine")
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
		theme = "catppuccin",
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
				symbols = { added = "  ", modified = "柳 ", removed = "  " },
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
				sections = { "error", "warn", "info", "hint" },
				symbols = { error = "⛔ ", warn = "🚦 ", info = "🚩 ", hint = "💡 " },
				-- symbols = { error = "✘ ", warn = "⚠ ", info = "⚑ ", hint = "✰ " },
				diagnostics_color = {
					error = { fg = colorList.red },
					warn = { fg = colorList.yellow },
					info = { fg = colorList.cyan },
					hint = { fg = colorList.green },
				},
			},
			{
				function()
					return search_result()
				end,
				color = { fg = colorList.yellow },
			},
			{
				"fileformat",
				padding = 2,
				cond = conditions.buffer_not_empty or conditions.hide_in_width,
				color = { bg = colorList.shade1 },
			},
			{
				"filesize",
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
				color = { bg = colorList.shade1 },
			},
		},
		lualine_y = {
			{
				"encoding",
				cond = conditions.buffer_not_empty and conditions.hide_in_width,
				color = { bg = colorList.shade2 },
			},
			{ "filetype", colored = true, color = { bg = colorList.shade2 } },
		},
		lualine_z = {
			{
				"progress",
				color = { fg = colorList.fg, bg = colorList.shade3 },
				cond = conditions.buffer_not_empty,
			},
			{
				"location",
				color = { fg = colorList.fg, bg = colorList.shade3 },
				cond = conditions.buffer_not_empty,
			},
		},
	},
}
lualine.setup(config)
