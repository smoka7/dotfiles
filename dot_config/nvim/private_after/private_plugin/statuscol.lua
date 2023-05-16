local statuscol = require('statuscol')
local builtin = require('statuscol.builtin')
local config = {
    segments = {
        {
            sign = {
                name = { 'GitSigns*' },
                maxwidth = 1,
                colwidth = 1,
            },
            click = 'v:lua.ScSa',
        },
        {
            sign = {
                name = { '.*' },
                maxwidth = 1,
                auto = true,
            },
            click = 'v:lua.ScSa',
        },
        {
            sign = {
                name = { 'Diagnostic' },
                maxwidth = 1,
                colwidth = 1,
            },
            click = 'v:lua.ScSa',
        },
        {
            text = { builtin.lnumfunc, ' ' },
            condition = { true, builtin.not_empty },
            click = 'v:lua.ScLa',
        },
        {
            text = { builtin.foldfunc, ' ' },
            click = 'v:lua.ScFa',
        },
    },
    clickhandlers = {
        Lnum = builtin.lnum_click,
        FoldClose = builtin.foldclose_click,
        FoldOpen = builtin.foldopen_click,
        FoldOther = builtin.foldother_click,
        DapBreakpointRejected = builtin.toggle_breakpoint,
        DapBreakpoint = builtin.toggle_breakpoint,
        DapBreakpointCondition = builtin.toggle_breakpoint,
        DiagnosticSignError = builtin.diagnostic_click,
        DiagnosticSignHint = builtin.diagnostic_click,
        DiagnosticSignInfo = builtin.diagnostic_click,
        DiagnosticSignWarn = builtin.diagnostic_click,
        GitSignsTopdelete = builtin.gitsigns_click,
        GitSignsUntracked = builtin.gitsigns_click,
        GitSignsAdd = builtin.gitsigns_click,
        GitSignsChange = builtin.gitsigns_click,
        GitSignsChangedelete = builtin.gitsigns_click,
        GitSignsDelete = builtin.gitsigns_click,
    },
}
statuscol.setup(config)
