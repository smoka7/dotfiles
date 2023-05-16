local C = {}

C.setup_catt = function()
    local utils = require('catppuccin.utils.colors')

    local cat = {
        styles = {
            keywords = { 'italic' },
            types = { 'italic' },
        },
        custom_highlights = function(colors)
            local cursorbg = utils.darken(colors.surface0, 0.6, colors.base)
            local fold = utils.lighten(colors.peach, 0.5, colors.base)

            return {
                CursorLine = { bg = cursorbg },
                --NormalNC = { bg = cursorbg },
                --CursorLineNr = { bg = cursorbg },
                --CursorLineSign = { bg = cursorbg },
                TreesitterContext = {
                    bg = utils.darken(cursorbg, 0.3, colors.base),
                },
                VertSplit = { fg = colors.base },
                FoldColumn = { bg = 'NONE', fg = fold },
                --CursorLineFold = { bg = cursorbg, fg = fold },
                CursorLineFold = { bg = 'NONE', fg = fold },

                CulDiagnosticSignError = { bg = cursorbg, fg = colors.red }, -- Used for "Error" signs in sign column
                CulDiagnosticSignWarn = { bg = cursorbg, fg = colors.yellow }, -- Used for "Warn" signs in sign column
                CulDiagnosticSignInfo = { bg = cursorbg, fg = colors.sky }, -- Used for "Info" signs in sign column
                CulDiagnosticSignHint = { bg = cursorbg, fg = colors.teal }, -- Used for "Hint" signs in sign column

                NoiceCursor = { fg = colors.peach, bg = cursorbg },

                TelescopePromptPrefix = { bg = colors.crust },
                TelescopePromptNormal = { bg = colors.crust },
                TelescopeResultsNormal = { bg = colors.mantle },
                TelescopePreviewNormal = { bg = colors.crust },
                TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
                TelescopeResultsBorder = { bg = colors.mantle, fg = colors.crust },
                TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
                TelescopePromptTitle = { fg = colors.crust },
                TelescopeResultsTitle = { fg = colors.text },
                TelescopePreviewTitle = { fg = colors.crust },
                TroubleFoldIcon = { bg = colors.base },
            }
        end,
        integrations = {
            dap = {
                enabled = true,
                enable_ui = true, -- enable nvim-dap-ui
            },
            dashboard = false,
            hop = true,
            neogit = true,
            neotest = true,
            nvimtree = false,
            which_key = true,
            noice = true,
            treesitter_context = true,
        },
    }
    require('catppuccin').setup(cat)
end

C.lighten = function()
    vim.cmd.colorscheme('catppuccin-latte')
end

C.darken = function()
    vim.cmd.colorscheme('catppuccin-mocha')
end

C.set_color_scheme = function()
    vim.api.nvim_create_user_command('Golight', C.lighten, {})
    --vim.api.nvim_create_user_command('CatppuccinRebuild', C.setup_catt, {})
    vim.api.nvim_create_user_command('GoDark', C.darken, {})
    C.setup_catt()
    local hour = tonumber(os.date('%H'))
    if hour < 18 and hour > 7 then
        C.lighten()
        return
    end
    C.darken()
end

return C
