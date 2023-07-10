return {
    overrides = function()
        local palette = require('kanagawa.colors').setup().palette
        return {
            WinSeparator = { fg = 'NONE' },
            TelescopeBorder = { fg = palette.sumiInk0, bg = palette.sumiInk0 },
            TelescopeNormal = { fg = palette.fujiWhite, bg = palette.sumiInk0 },
            TelescopePromptBorder = { fg = palette.sumiInk4, bg = palette.sumiInk4 },
            TelescopePromptNormal = { fg = palette.fujiWhite, bg = palette.sumiInk4 },
            TelescopeSelection = { fg = palette.fujiWhite, bg = palette.sumiInk4 },
            TelescopePreviewTitle = { fg = palette.sumiInk4, bg = palette.oniViolet },
            TelescopePromptTitle = { fg = palette.sumiInk4, bg = palette.sakuraPink },
        }
    end,
}
