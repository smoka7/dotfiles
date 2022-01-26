-- vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = true
local hour = tonumber(os.date("%H"))
if hour < 18 and hour > 7 then
	vim.cmd([[colorscheme celeste-nvim]])
else
	vim.g.calvera_style = "deep-ocean"
	vim.g.transparent_bg = false
	vim.g.calvera_borders = true
	vim.g.calvera_contrast = true
	vim.g.calvera_italic_comments = true
	vim.g.calvera_italic_keywords = true
	vim.g.calvera_italic_functions = true
	vim.g.calvera_italic_variables = true
	vim.g.calvera_disable_background = false
	-- vim.g.calvera_custom_colors = { black = "#000000", bg = "#0F111A" }
	require("calvera").set()
end

