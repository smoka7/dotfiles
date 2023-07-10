return {
    settings = {
        gopls = {
            --build = {
            --    directoryFilters = { '-**/node_modules' },
            --},
            -- analyses = {
            --     unusedparams = true,
            -- },
            -- staticcheck = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
                functionTypeParameters = true,
            },
        },
    },
}
