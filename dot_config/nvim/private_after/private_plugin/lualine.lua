local colorList = require('catppuccin.palettes').get_palette()
local lualine = require('lualine')
local conditions = require('utils')
local gps = require('nvim-gps')
gps.setup()
local function search_result()
    if vim.v.hlsearch == 0 then
        return ''
    end
    local last_search = vim.fn.getreg('/')
    if not last_search or last_search == '' then
        return ''
    end
    local searchcount = vim.fn.searchcount({ maxcount = 9999 })
    if searchcount.total == 0 then
        return ''
    end
    --return "🔎 " .. searchcount.current .. "/" .. searchcount.total
    return '‽ ' .. searchcount.current .. '/' .. searchcount.total
end

local exclude_filetype = {
    'help',
    'startify',
    'dashboard',
    'packer',
    'neogitstatus',
    'NvimTree',
    'Telescope',
    'fzf-lua',
    'neo-tree',
    'Trouble',
    'alpha',
    'lir',
    'Outline',
    'spectre_panel',
    'toggleterm',
    'qf',
}

local config = {
    extensions = { 'neo-tree', 'trouble', 'lazy', 'fzf' },
    options = {
        theme = 'catppuccin',
        globalstatus = true,
        --disabled_filetypes = { tabline = exclude_filetype, winbar = exclude_filetype },
        component_separators = '',
        section_separators = '',
        -- component_separators = { left = "\\", right = "\\" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        icons_enabled = 1,
    },

    tabline = {
        lualine_a = { { 'buffers', filetype_names = { ['neo-tree'] = '' } } },

        lualine_z = { 'tabs' },
    },
    sections = {
        lualine_a = {
            {
                'mode',
            },
            {
                'location',
                color = { fg = colorList.fg, bg = colorList.shade3 },
                cond = conditions.buffer_not_empty,
            },
        },
        lualine_b = {
            -- {
            --     'filename',
            --     symbols = {
            --         modified = ' +', -- Text to show when the file is modified.
            --         readonly = ' -', -- Text to show when the file is non-modifiable or readonly.
            --     },
            --     cond = conditions.buffer_not_empty,
            -- },
            {
                'branch',
                icon = { '🌲' },
                -- icon = '',
                condition = conditions.check_git_workspace,
                color = { fg = colorList.blue, bg = colorList.shade2 },
            },
        },
        lualine_c = {

            {
                'diff',
                condition = conditions.check_git_workspace and conditions.hide_in_width,
                colored = true,
                color = { bg = colorList.shade3 },
                diff_color = {
                    added = { fg = colorList.green },
                    modified = { fg = colorList.blue },
                    removed = { fg = colorList.red },
                },
                symbols = { added = '  ', modified = '柳 ', removed = '  ' },
            },
            {
                function()
                    return gps.get_location()
                end,
                cond = function()
                    return gps.is_available()
                end,
            },
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                cond = conditions.buffer_not_empty and conditions.hide_in_width,
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = '● ', warn = '● ', info = '● ', hint = '● ' },
                --symbols = { error = "⛔ ", warn = "🚦 ", info = "🚩 ", hint = "💡 " },
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
                'fileformat',
                padding = 2,
                cond = conditions.buffer_not_empty or conditions.hide_in_width,
                color = { bg = colorList.shade1 },
            },
            {
                'filesize',
                cond = conditions.buffer_not_empty and conditions.hide_in_width,
                color = { bg = colorList.shade1 },
            },
        },
        lualine_y = {
            {
                'encoding',
                cond = conditions.buffer_not_empty and conditions.hide_in_width,
                color = { bg = colorList.shade2 },
            },
            { 'filetype', colored = true, color = { bg = colorList.shade2 } },
        },
        lualine_z = {
            -- {
            --     'progress',
            --     color = { fg = colorList.fg, bg = colorList.shade3 },
            --     cond = conditions.buffer_not_empty,
            -- },
        },
    },
}
lualine.setup(config)
