vim.diagnostic.config {
    underline = false,
    float = {
        show_header = false,
        source = false,
        focus = false,
        width = 60,
    },
    virtual_text = {
        source = false,
        spacing = 2,
        scope = 'l',
        severity = 'error',
    },
}

vim.api.nvim_create_user_command('HideAll', vim.diagnostic.reset, {})

local signs = { Error = '●', Warn = '●', Info = '●', Hint = '●' }
--local x = { Error = '⛔', Warn = '🚦', Info = '🚩', Hint = '💡' }
for key, sign in pairs(signs) do
    vim.fn.sign_define(
        'DiagnosticSign' .. key,
        { text = sign, texthl = 'DiagnosticSign' .. key, culhl = 'CulDiagnosticSign' .. key }
    )
end
