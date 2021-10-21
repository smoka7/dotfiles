local gray = "#757575"
local black = "#1b222d"
local white = "#f1faee"
local green = "#c0ca33"
local orange = "#f4511e"

require"bufferline".setup {
    options = {
        offsets = {{filetype = "nvimtree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin"
        -- mappings = "true"
    },
    highlights = {
        fill = {guifg = gray, guibg = "NONE"},
        background = {guifg = black, guibg = "NONE"},
        buffer_selected = {guifg = black, guibg = green, gui = "bold"},
        buffer_visible = {guifg = gray, guibg = "NONE"},
        close_button = {guifg = gray, guibg = "NONE"},
        close_button_visible = {guifg = white, guibg = "NONE"},
        close_button_selected = {guifg = black, guibg = green},
        tab = {guifg = black, guibg = white},
        tab_selected = {guifg = black, guibg = green},
        tab_close = {guifg = orange, guibg = "NONE"},
        separator = {guifg = gray, guibg = "NONE"},
        separator_selected = {guifg = black, guibg = green},
        separator_visible = {guifg = black, guibg = green},
        indicator_selected = {guifg = black, guibg = green},
        modified = {guifg = orange, guibg = "NONE"},
        modified_selected = {guifg = black, guibg = green},
        modified_visible = {guifg = orange, guibg = "NONE"}
    }
}
local opt = {silent = true}
local map = vim.api.nvim_set_keymap
-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
local g = vim.g
g.nvim_tree_ignore = {".git", "node_modules", ".cache", "vendor"}
g.nvim_tree_git_hl = 1
g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}
g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "💬",
        staged = "👍",
        unmerged = "",
        renamed = "➜",
        untracked = "🤷",
        deleted = "💀",
        ignored = "💤"
    },
    folder = {default = "📁", open = "📂", symlink = "", empty = "", empty_open = "", symlink_open = ""}
}
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {enable = true},
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    view = {width = 30, side = 'left', auto_resize = false, mappings = {custom_only = false, list = {}}}
}

