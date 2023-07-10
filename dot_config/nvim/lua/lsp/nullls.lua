local nullLs = require 'null-ls'
local h = require 'null-ls.helpers'
local FORMATTING = 'NULL_LS_FORMATTING'
local RANGE_FORMATTING = 'NULL_LS_RANGE_FORMATTING'

local selene = nullLs.builtins.diagnostics.selene
local prettier = h.make_builtin {
    name = 'pr',
    method = { FORMATTING, RANGE_FORMATTING },
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'css',
        'scss',
        'less',
        'html',
        'json',
        'jsonc',
        'yaml',
        'markdown',
        'graphql',
        'handlebars',
    },
    generator_opts = {
        command = 'prettier',
        args = h.range_formatting_args_factory({
            '--stdin-filepath',
            '$FILENAME',
            '--plugin',
            'prettier-plugin-tailwindcss',
        }, '--range-start', '--range-end', { row_offset = -1, col_offset = -1 }),
        to_stdin = true,
    },
    factory = h.formatter_factory,
}

selene.args = { '--display-style', 'quiet', '-', '--config', '~/.config/selene/selene.toml' }

nullLs.setup {
    debug = false,
    sources = {
        nullLs.builtins.formatting.fish_indent,
        nullLs.builtins.formatting.gofumpt,
        nullLs.builtins.formatting.pint,
        nullLs.builtins.formatting.shfmt,
        nullLs.builtins.formatting.rustfmt,
        nullLs.builtins.formatting.stylua,
        --nullLs.builtins.formatting.prettierd,
        --nullLs.builtins.formatting.rustywind,
        nullLs.builtins.diagnostics.fish,
        --prettier,
        --selene,
        -- nullLs.builtins.formatting.phpcbf,
        -- nullLs.builtins.formatting.eslint_d,
        -- nullLs.builtins.diagnostics.phpmd,
        -- nullLs.builtins.diagnostics.vale,
        -- nullLs.builtins.diagnostics.phpstan,
        -- nullLs.builtins.code_actions.eslint_d,
    },
}

vim.api.nvim_create_user_command('Prettier', function()
    if nullLs.is_registered(prettier) then
        nullLs.deregister(prettier)
        return
    end
    nullLs.register(prettier)
end, {})

vim.api.nvim_create_user_command('EslintD', function()
    if nullLs.is_registered(nullLs.builtins.diagnostics.eslint_d) then
        nullLs.deregister(nullLs.builtins.diagnostics.eslint_d)
        return
    end
    nullLs.register(nullLs.builtins.diagnostics.eslint_d)
end, {})

vim.api.nvim_create_user_command('Phpcbf', function()
    if nullLs.is_registered(nullLs.builtins.formatting.phpcbf) then
        nullLs.deregister(nullLs.builtins.formatting.phpcbf)
        return
    end
    nullLs.register(nullLs.builtins.formatting.phpcbf)
end, {})
