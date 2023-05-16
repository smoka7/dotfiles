require('which-key').setup({
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        },
    },
    window = {
        position = 'bottom',
        margin = { 1, 1, 1, 1 },
    },
    show_help = false,
    show_keys = false,
})
