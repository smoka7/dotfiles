return {
    'folke/noice.nvim',
    lazy = true,
    event = 'VeryLazy',
    cond = not (vim.g.vscode or vim.g.neovide),
    keys = {
        { mode = 'n', '<Leader>=', '<Cmd>NoiceLast<cr>' },
        { mode = 'n', '<Leader>-', '<Cmd>NoiceHistory<cr>' },
    },
    opts = {
        views = {
            cmdline_popup = { border = { style = 'rounded' } },
        },
        messages = { view = 'mini', view_search = false, view_warn = 'mini', view_split = 'mini' },
        show_help = false,
        format = { spinner = {
            name = 'mindblown',
        } },
        lsp = {

            message = {
                view = 'mini',
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
            lsp_doc_border = 'rounded', -- add a border to hover docs and signature help
        },
    },
}
