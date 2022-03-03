local hour = tonumber(os.date("%H"))
if hour < 18 and hour > 7 then
	vim.cmd([[colorscheme celeste-nvim]])
else
	vim.g.tokyonight_style = "storm"
	vim.g.tokyonight_italic_functions = true
	vim.cmd([[colorscheme tokyonight]])
end

local ColorList = {
	bg = "#202328",
	black = "#1b222d",
	blue = "#51afef",
	cyan = "#008080",
	darkblue = "#081633",
	fg = "#EDF2F4",
	gray = "#757575",
	green = "#aadd33",
	green_l = "#c0ca33",
	magenta = "#c678dd",
	orange = "#FF8800",
	red = "#ec5f67",
	shade1 = "#282a36",
	shade2 = "#2b2e3b",
	shade3 = "#363949",
	violet = "#a9a1e1",
	white = "#f1faee",
	yellow = "#fdd835",
}
return ColorList
