local lualine = require 'lualine'
-- Color table for highlights
local colors = {
    bg = '#202328',
    fg = '#bbc2cf',
    yellow = '#ECBE7B',
    green = '#98be65',
    cyan = '#008080',
    blue = '#51afef',
    red = '#ec5f67'
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

-- Config
local config = {
    options = {
        theme = 'onedark',
        component_separators = {'\\', '/'},
        section_separators = {'', ''},
        icons_enabled = 1, -- displays icons in alongside component
        padding = 1, -- adds padding to the left and right of components
        left_padding = 1, -- adds padding to the left of components
        right_padding = 1 -- adds padding to the right of components
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'branch',
                icon = '🌲',
                condition = conditions.check_git_workspace,
                color = {fg = colors.violet, gui = 'bold'}
            }
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', {'filetype', colored = true}},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end
ins_left {
    'diff',
    colored = true, -- displays diff status in color if set to true
    -- all colors are in format #rrggbb
    color_added = colors.green, -- changes diff's added foreground color
    color_modified = colors.blue, -- changes diff's modified foreground color
    color_removed = colors.red, -- changes diff's removed foreground color
    symbols = {added = '+ ', modified = '~ ', removed = '- '}
}
ins_left {
    'diagnostics',
    sources = {'nvim_lsp'},
    sections = {'error', 'warn', 'info', 'hint'},
    symbols = {error = '⛔', warn = '⚠', info = '🚩', hint = '💡'},
    color_error = colors.red,
    color_warn = colors.yellow,
    color_info = colors.cyan,
    color_hint = colors.blue
}
lualine.setup(config)
