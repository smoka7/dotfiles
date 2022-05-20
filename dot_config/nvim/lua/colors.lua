require('indent_blankline').setup({
  -- space_char_blankline = ' ',
  show_current_context = true,
  indent_blankline_context_char_list = { '┃', '║', '╬', '█' },
  use_treesitter = true,
  show_first_indent_level = true,
  filetype_exclude = { 'NvimTree' },
})

local function lighten()
  vim.cmd([[colorscheme celeste-nvim]])
end

local function darken()
  vim.g.tokyonight_style = 'storm'
  vim.o.background = 'dark'
  vim.g.tokyonight_italic_functions = true
  vim.cmd([[colorscheme tokyonight]])
end

local hour = tonumber(os.date('%H'))
-- vim.cmd([[colorscheme celeste-dark]])
if hour < 18 and hour > 7 then
    lighten()
else
  darken()
end
vim.api.nvim_create_user_command('Golight', lighten, {})
vim.api.nvim_create_user_command('GoDark', darken, {})
local ColorList = {
  bg = '#202328',
  black = '#1b222d',
  blue = '#51afef',
  cyan = '#008080',
  darkblue = '#081633',
  fg = '#EDF2F4',
  flamingo = '#F2CDCD',
  gray = '#757575',
  gray1 = '#988BA2',
  gray2 = '#C3BAC6',
  green = '#aadd33',
  green_l = '#c0ca33',
  magenta = '#c678dd',
  orange = '#FF8800',
  peach = '#F8BD96',
  pink = '#F5C2E7',
  red = '#F28FAD',
  rosewater = '#F5E0DC',
  shade1 = '#282a36',
  shade2 = '#2b2e3b',
  shade3 = '#363949',
  sky = '#89DCEB',
  teal = '#B5E8E0',
  violet = '#a9a1e1',
  white = '#f1faee',
  yellow = '#fdd835',
  celeste = {},
}

ColorList.celeste.normal = {
  a = { bg = ColorList.blue, fg = ColorList.shade1 },
  b = { bg = ColorList.shade1, fg = ColorList.blue },
  c = { bg = ColorList.shade2, fg = ColorList.white },
}

ColorList.celeste.insert = {
  a = { bg = ColorList.green, fg = ColorList.shade1 },
  b = { bg = ColorList.shade1, fg = ColorList.teal },
}

ColorList.celeste.command = {
  a = { bg = ColorList.peach, fg = ColorList.shade1 },
  b = { bg = ColorList.shade1, fg = ColorList.peach },
}

ColorList.celeste.visual = {
  a = { bg = ColorList.yellow, fg = ColorList.shade1 },
  b = { bg = ColorList.shade1, fg = ColorList.yellow },
}

ColorList.celeste.replace = {
  a = { bg = ColorList.red, fg = ColorList.shade1 },
  b = { bg = ColorList.shade1, fg = ColorList.red },
}
ColorList.celeste.terminal = {
  a = { bg = ColorList.orange, fg = ColorList.shade1 },
  b = { bg = ColorList.shade1, fg = ColorList.orange },
}

ColorList.celeste.inactive = {
  a = { bg = ColorList.shade3, fg = ColorList.fg },
  b = { bg = ColorList.shade3, fg = ColorList.fg },
  c = { bg = ColorList.shade3, fg = ColorList.fg },
}

return ColorList
