return {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
        styles = {
            keywords = { 'italic' },
            types = { 'italic' },
            -- strings = {},
            -- variables = {},
            numbers = { 'italic' },
            comments = { 'italic' },
        },
        custom_highlights = function(colors)
            local utils = require 'catppuccin.utils.colors'
            local cursorbg = utils.darken(colors.surface0, 0.6, colors.base)
            local fold = utils.lighten(colors.peach, 0.5, colors.base)

            return {
                --CursorLine = { bg = cursorbg },
                --NormalNC = { bg = cursorbg },
                --CursorLineNr = { bg = cursorbg },
                --CursorLineSign = { bg = cursorbg },
                TreesitterContext = {
                    bg = utils.darken(cursorbg, 0.3, colors.base),
                },
                --VertSplit = { fg = colors.base },
                FoldColumn = { bg = 'NONE', fg = fold },
                --CursorLineFold = { bg = cursorbg, fg = fold },
                CursorLineFold = { bg = 'NONE', fg = fold },

                CulDiagnosticSignError = { bg = cursorbg, fg = colors.red }, -- Used for "Error" signs in sign column
                CulDiagnosticSignWarn = { bg = cursorbg, fg = colors.yellow }, -- Used for "Warn" signs in sign column
                CulDiagnosticSignInfo = { bg = cursorbg, fg = colors.sky }, -- Used for "Info" signs in sign column
                CulDiagnosticSignHint = { bg = cursorbg, fg = colors.teal }, -- Used for "Hint" signs in sign column

                NoiceCursor = { fg = colors.peach, bg = cursorbg },

                -- TelescopePromptPrefix = { bg = colors.crust },
                -- TelescopePromptNormal = { bg = colors.crust },
                -- TelescopeResultsNormal = { bg = colors.mantle },
                -- TelescopePreviewNormal = { bg = colors.crust },
                -- TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
                -- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.crust },
                -- TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
                -- TelescopePromptTitle = { fg = colors.crust },
                -- TelescopeResultsTitle = { fg = colors.text },
                -- TelescopePreviewTitle = { fg = colors.crust },
                TroubleFoldIcon = { bg = colors.base },
            }
        end,
        integrations = {
            alpha = false,
            barbecue = false,
            dap = {
                enabled = true,
                enable_ui = true, -- enable nvim-dap-ui
            },
            dashboard = false,
            hop = true,
            mini = true,
            neogit = true,
            telescope = { enabled = true },
            neotest = true,
            neotree = true,
            nvimtree = false,
            which_key = true,
            noice = true,
            treesitter_context = true,
        },
    },
}
