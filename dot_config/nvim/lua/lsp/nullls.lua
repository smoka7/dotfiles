local nullLs = require('null-ls')
nullLs.setup({
  sources = {
    -- nullLs.builtins.code_actions.eslint_d,
    nullLs.builtins.diagnostics.write_good,
    nullLs.builtins.formatting.phpcbf,
    nullLs.builtins.diagnostics.phpstan,
    nullLs.builtins.diagnostics.phpmd,
    nullLs.builtins.formatting.fish_indent,
    nullLs.builtins.formatting.eslint_d,
    nullLs.builtins.formatting.gofumpt,
  },
})

vim.api.nvim_create_user_command('EslintD', function()
  if nullLs.is_registered(nullLs.builtins.diagnostics.eslint_d) then
    nullLs.deregister(nullLs.builtins.diagnostics.eslint_d)
  else
    nullLs.register(nullLs.builtins.diagnostics.eslint_d)
  end
end, {})

vim.api.nvim_create_user_command('HideAll', function()
  vim.diagnostic.reset()
end, {})
