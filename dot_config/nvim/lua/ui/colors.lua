local function setup_catt()
	local cat = {
		compile = {
			enabled = true,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
	}
	require("catppuccin").setup(cat)
end

local flavours = { "latte", "frappe", "macchiato", "mocha" }
local compile = function()
	for _, flavour in pairs(flavours) do
		local colors = require("catppuccin.palettes").get_palette(flavour)
		local config = {
			term_colors = true,
			compile = {
				enabled = true,
				path = vim.fn.stdpath("cache") .. "/catppuccin",
			},
			styles = {
				keywords = { "italic" },
				types = { "italic" },
			},
			custom_highlights = {
				CursorLineNr = { bg = colors.surface0 },
				CursorLineSign = { bg = colors.surface0 },
				CursorLine = { bg = colors.surface0 },
			},
			integrations = {
				nvimtree = false,
				dap = { enabled = true },
				which_key = true,
				neogit = true,
				hop = true,
				dashboard = false,
				notify = false,
				telekasten = false,
				beacon = false,
				symbols_outline = false,
			},
		}
		require("catppuccin.lib.compiler").compile(flavour, config)
	end
end

setup_catt()
if
	not os.rename(
		vim.fn.stdpath("cache") .. "/catppuccin/latte_compiled.lua",
		vim.fn.stdpath("cache") .. "/catppuccin/latte_compiled.lua"
	)
then
	compile()
end

local function lighten()
	vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
	require("catppuccin").load()
end

local function darken()
	vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
	vim.o.background = "dark"
	require("catppuccin").load()
end

local hour = tonumber(os.date("%H"))
if hour < 18 and hour > 7 then
	lighten()
else
	darken()
end

vim.api.nvim_create_user_command("Golight", lighten, {})
vim.api.nvim_create_user_command("GoDark", darken, {})

local M = {}
M.compile = compile()

return M
