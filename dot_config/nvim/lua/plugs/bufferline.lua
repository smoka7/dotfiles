local cl = require('colors')

local map = require('utils').map
require('bufferline').setup({
  options = {
    close_icon = '',
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    show_buffer_close_icons = true,
    separator_style = 'thin',
  },
  highlights = {
    -- background = { guifg = green, guibg = green },
    -- buffer_visible = { guifg = gray, guibg = "NONE" },
    -- close_button = { guifg = gray, guibg = "NONE" },
    -- close_button_visible = { guifg = white, guibg = "NONE" },
    -- duplicate_visible = { guifg = gray, guibg = "NONE" },
    -- modified = { guifg = orange, guibg = "NONE" },
    -- modified_visible = { guifg = orange, guibg = "NONE" },
    -- separator = { guifg = gray, guibg = "NONE" },
    -- separator_visible = { guifg = black, guibg = green },
    -- tab = { guifg = black, guibg = white },
    -- tab_close = { guifg = orange, guibg = "NONE" },

    -- fill = { guibg = "NONE" },
    -- buffer_selected = { guifg = cl.black, guibg = cl.green_l },
    -- close_button_selected = { guifg = cl.black, guibg = cl.green_l },
    -- duplicate_selected = { guifg = cl.black, guibg = cl.green_l },
    -- indicator_selected = { guifg = cl.black, guibg = cl.green_l },
    -- modified_selected = { guifg = cl.black, guibg = cl.green_l },
    -- separator_selected = { guifg = "NONE", guibg = "NONE" },
    -- tab_selected = { guifg = cl.black, guibg = cl.green_l },
  },
})
local opt = { silent = true }
map('n', '<TAB>', [[<Cmd>BufferLineCycleNext<CR>]], opt)
-- map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- require('nvim-tree').setup({
--   hijack_cursor = true,
--   update_cwd = true,
--   diagnostics = {
--     enable = true,
--     show_on_dirs = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
--   view = {
--     -- preserve_window_proportions = true,
--     -- hide_root_folder = true,
--   },
--   actions = {
--     open_file = { quit_on_open = true },
--   },
-- })
