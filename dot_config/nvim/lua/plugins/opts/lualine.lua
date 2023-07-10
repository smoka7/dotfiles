local conditions = require('utils')

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

return {
    extensions = { 'neo-tree', 'trouble', 'lazy', 'fzf' },
    options = {
        --theme = 'catppuccin',
        globalstatus = true,
        disabled_filetypes = { tabline = exclude_filetype, winbar = exclude_filetype },
        component_separators = '',
        section_separators = '',
        icons_enabled = 1,
    },

    tabline = {
        lualine_a = { { 'buffers', filetype_names = { ['neo-tree'] = '' } } },

        lualine_z = { 'tabs' },
    },
    sections = {
        lualine_a = {
            { 'mode' },
            {
                'location',
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
            },
        },
        lualine_c = {

            {
                'diff',
                condition = conditions.check_git_workspace and conditions.hide_in_width,
                colored = true,
                diff_color = {},
                symbols = { added = '  ', modified = '柳 ', removed = '  ' },
            },
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                cond = conditions.buffer_not_empty and conditions.hide_in_width,
                symbols = { error = '● ', warn = '● ', info = '● ', hint = '● ' },
                --symbols = { error = "⛔ ", warn = "🚦 ", info = "🚩 ", hint = "💡 " },
                -- symbols = { error = "✘ ", warn = "⚠ ", info = "⚑ ", hint = "✰ " },
            },
            { search_result },
            {
                'fileformat',
                padding = 2,
                cond = conditions.buffer_not_empty or conditions.hide_in_width,
            },
            {
                'filesize',
                cond = conditions.buffer_not_empty and conditions.hide_in_width,
            },
        },
        lualine_y = {
            {
                'encoding',
                cond = conditions.buffer_not_empty and conditions.hide_in_width,
            },
        },
        lualine_z = {},
    },
}
