local function setup_catt()
	local cat = {
		styles = {
			keywords = { "italic" },
			types = { "italic" },
		},
		custom_highlights = function(colors)
			return {
				CursorLineNr = { bg = colors.surface0 },
				CursorLineSign = { bg = colors.surface0 },
				CursorLine = { bg = colors.surface0 },
			}
		end,
		integrations = {
			dap = {
				enabled = true,
				enable_ui = true, -- enable nvim-dap-ui
			},
			dashboard = false,
			fidget = true,
			hop = true,
			neogit = true,
			neotest = true,
			nvimtree = false,
			which_key = true,
			noice = true,
			treesitter_context = true,
		},
	}
	require("catppuccin").setup(cat)
end

setup_catt()

local function lighten()
	vim.cmd([[colorscheme catppuccin-latte]])
end

local function darken()
	vim.cmd([[colorscheme catppuccin-mocha]])
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
M.compile = compile

return M
