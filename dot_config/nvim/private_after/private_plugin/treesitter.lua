require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'comment',
        'css',
        'diff',
        'fish',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'http',
        'ini',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'query',
        'rasi',
        'regex',
        'rust',
        'scheme',
        'scss',
        'sql',
        'teal',
        'todotxt',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
    },

    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
        navigation = {
            enable = true,
            keymaps = {
                goto_next_usage = 'g1',
                goto_previous_usage = 'g2',
            },
        },
    },

    highlight = {
        enable = true,
        custom_captures = {},
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<Return>',
            node_incremental = '<Return>',
            scope_incremental = '<A-Return>',
            node_decremental = '<BS>',
        },
    },

    indent = {
        enable = true,
    },

    textobjects = {
        enable = true,
        select = {
            enable = true,
            lookahead = false, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },

        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
            goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
            goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
            goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
        },
        swap = {
            enable = true,
            swap_next = { ['<leader>a'] = '@parameter.inner' },
            swap_previous = { ['<leader>A'] = '@parameter.inner' },
        },
    },
    pairs = {
        enable = true,
        disable = {},
        highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
        highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
        goto_right_end = false, -- whether to go to the end of the right partner or the beginning
        fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
        keymaps = {
            goto_partner = '%',
            delete_balanced = 'X',
        },
        delete_balanced = {
            only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
            fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
            longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
            -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
        },
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    textsubjects = {
        enable = true,
        prev_selection = ';', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['<cr>'] = 'textsubjects-smart',
            ['.'] = 'textsubjects-container-outer',
            [','] = 'textsubjects-container-inner',
        },
    },
})
require('treesitter-context').setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
            'class',
            'function',
            'method',
            'for', -- These won't appear in the context
            -- 'while',
            'if',
            'switch',
            'case',
        },
    },
})

require('nvim-autopairs').setup({
    check_ts = true,
    enable_check_bracket_line = true,
    ignored_next_char = '[%w%.,->]', -- will ignore alphanumeric and `.` symbol
    map_c_w = true,
})

