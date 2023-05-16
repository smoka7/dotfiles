vim.g.coq_settings = {
    auto_start = true,
    display = {
        pum = {
            fast_close = false,
            source_context = { ' ', ' ' },
            kind_context = { ' ', ' ' },
        },
        preview = { border = 'single' },
        ghost_text = { context = { '', '' } },
    },
}
require('coq')
