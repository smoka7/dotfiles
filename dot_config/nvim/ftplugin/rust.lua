local opts = {
    tools = { -- rust-tools options
        execute = require('rust-tools.executors').termopen,
        on_initialized = nil,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = false,
            only_current_line = true,
            show_parameter_hints = true,
            parameter_hints_prefix = '●',
            other_hints_prefix = '🞛',
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = 'Comment',
        },
    },
    server = {
        standalone = false,
        settings = {
            ['rust-analyzer'] = {
                -- cargo = {
                -- 	features = { "exercises" },
                -- },
                -- enable clippy on save
                checkOnSave = {
                    command = 'clippy',
                },
            },
        },
    },
}
-- 
require('rust-tools').setup(opts)
