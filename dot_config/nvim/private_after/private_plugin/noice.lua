if vim.g.vscode or vim.g.neovide then
    return
end
local noice = require('noice')

local config = {
    views = {
        cmdline_popup = { border = { style = 'single' } },
    },
    messages = { view = 'mini', view_search = false, view_warn = 'mini', view_error = 'mini' },
    show_help = false,
    lsp = {

        message = {
            -- Messages shown by lsp servers
            enabled = true,
            view = 'mini',
            opts = {},
        },
        documentation = {
            view = 'hover',
            opts = {
                size = {
                    width = 'auto',
                    height = 'auto',
                    max_height = 10,
                    max_width = 80,
                },
            },
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
}
noice.setup(config)

vim.keymap.set({ 'n', 'i', 's' }, '<c-f>', function()
    if not require('noice.lsp').scroll(4) then
        return '<c-f>'
    end
end, { silent = true, expr = true })

vim.keymap.set({ 'n', 'i', 's' }, '<c-b>', function()
    if not require('noice.lsp').scroll(-4) then
        return '<c-b>'
    end
end, { silent = true, expr = true })
