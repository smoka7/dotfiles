local map = require('builtins.maps')
local nmap = map.nmap
local vmap = map.vmap

nmap('<Leader><space>', vim.lsp.buf.hover, { desc = 'hover doc' })
nmap('<RightMouse>', vim.lsp.buf.hover, { desc = 'hover doc' })

nmap('[d', vim.diagnostic.goto_prev, { desc = 'prev diagnostic' })
nmap(']d', vim.diagnostic.goto_next, { desc = 'next diagnostic' })

nmap('[e', function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'prev error' })

nmap(']e', function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'next error' })

nmap('<space>f', function()
    vim.lsp.buf.format({ async = true, name = 'null-ls' })
end, { desc = 'format document' })

nmap('<Leader>r', vim.lsp.buf.rename, { desc = 'rename lsp' })

nmap('<Space>a', '<cmd>FzfLua lsp_code_actions<CR>', { desc = 'code actions' })
nmap('<Space>r', '<cmd>Trouble lsp_references<cr>', { desc = 'lsp refrences' })

nmap('<Leader>s', '<cmd>Telescope lsp_document_symbols<cr>', { desc = 'document symbols' })
nmap('<Leader>d', '<cmd>Telescope lsp_definitions<CR>', { desc = 'lsp definition' })
nmap('<Leader>ld', '<cmd>FzfLua lsp_declarations<CR>', { desc = 'lsp declaration' })
nmap('<Leader>li', '<cmd>Telescope lsp_implementations<CR>', { desc = 'lsp implementation' })
nmap('<Leader>ll', '<cmd>Trouble document_diagnostics<CR>', { desc = 'list diagnostics' })

vmap('<leader>ls', require('telescope').extensions.refactoring.refactors, { desc = 'refactor actions' })
