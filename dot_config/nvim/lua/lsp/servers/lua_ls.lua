return {
    settings = {
        Lua = {
            hint = {
                enable = true,
                arrayIndex = 'Disable',
                await = true,
                paramName = 'Literal',
                paramType = true,
                semicolon = 'SameLine',
                setType = false,
            },
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- library = vim.api.nvim_get_runtime_file("",true)
            },
        },
    },
}
