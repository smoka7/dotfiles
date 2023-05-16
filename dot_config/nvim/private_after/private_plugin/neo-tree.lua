local config = {
    log_level = 'warn', -- "trace", "debug", "info", "warn", "error", "fatal"
    close_if_last_window = true,
    default_component_configs = {
        indent = {
            with_markers = false,
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        },
        git_status = {
            symbols = {
                added = '✚',
                deleted = '✖',
                modified = '',
                renamed = '',
                untracked = 't',
                ignored = 'i',
                unstaged = 'u',
                staged = 's',
                conflict = 'c',
            },
            align = 'right',
        },
    },
    filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = 'open_default',
    },
}
local tree = require('neo-tree')
tree.setup(config)
vim.keymap.set('n', '<Space>e', function()
    tree.reveal_current_file('filesystem', true, true)
end)
