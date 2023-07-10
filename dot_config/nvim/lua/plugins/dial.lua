return {
    'monaqa/dial.nvim',
    config = function()
        local augend = require 'dial.augend'
        require('dial.config').augends:register_group {
            default = {
                augend.integer.alias.decimal,
                augend.constant.new { elements = { 'let', 'const' } },
                augend.constant.new {
                    elements = { 'nil', 'null' },
                    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                    cyclic = true, -- "or" is incremented into "and".
                },
                augend.constant.new {
                    elements = { 'and', 'or' },
                    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                    cyclic = true, -- "or" is incremented into "and".
                },
                augend.constant.new {
                    elements = { '&&', '||' },
                    word = false,
                    cyclic = true,
                },
                augend.constant.alias.bool,
                augend.semver.alias.semver,
                augend.integer.alias.hex,
                augend.date.alias['%Y/%m/%d'],
            },
        }
        vim.cmd [[
nmap  <C-a>  <Plug>(dial-increment)
nmap  <C-x>  <Plug>(dial-decrement)
nmap g<C-a> g<Plug>(dial-increment)
nmap g<C-x> g<Plug>(dial-decrement)
vmap  <C-a>  <Plug>(dial-increment)
vmap  <C-x>  <Plug>(dial-decrement)
vmap g<C-a> g<Plug>(dial-increment)
vmap g<C-x> g<Plug>(dial-decrement)]]
    end,
}
