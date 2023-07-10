return {
    'booperlv/nvim-gomove',
    event = 'VeryLazy',
    opts = {
        map_smart = false,
        reindent = true,
        undojoin = true,
        move_past_end_col = false,
        ignore_indent_lh_dup = true,
    },
    keys = {
        { '<S-Down>', '<Plug>GoNSMDown', mode = { 'i', 'n' } },
        { '<S-Up>', '<Plug>GoNSMUp', mode = { 'n', 'i' } },
        { '<S-Up>', '<Plug>GoVMLineUp', mode = { 'x' } },
        { '<S-Down>', '<Plug>GoVMLineDown', mode = { 'x' } },
    },
}
