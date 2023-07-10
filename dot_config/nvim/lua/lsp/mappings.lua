vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local map = require 'builtins.maps'
        local nmap = map.nmap
        local vmap = map.vmap
        local cmd = map.cmd

        nmap('K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'hover doc' })
        nmap('<RightMouse>', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'hover doc' })

        nmap('[d', vim.diagnostic.goto_prev, { buffer = ev.buf, desc = 'prev diagnostic' })
        nmap(']d', vim.diagnostic.goto_next, { buffer = ev.buf, desc = 'next diagnostic' })

        nmap('[e', function()
            vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
        end, { buffer = ev.buf, desc = 'prev error' })

        nmap(']e', function()
            vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
        end, { buffer = ev.buf, desc = 'next error' })

        nmap('<F2>', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'rename lsp' })
        nmap('<leader>r', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'rename lsp' })

        nmap('<F3>', function()
            vim.lsp.buf.format { async = true, name = 'null-ls' }
        end, { buffer = ev.buf, desc = 'format document' })

        nmap('<F4>', cmd 'FzfLua lsp_code_actions', { buffer = ev.buf, desc = 'code actions' })
        vmap('<F4>', cmd 'FzfLua lsp_code_actions', { buffer = ev.buf, desc = 'code actions' })

        nmap('gr', cmd 'Trouble lsp_references', { buffer = ev.buf, desc = 'lsp refrences' })
        nmap('gl', cmd 'Trouble document_diagnostics', { buffer = ev.buf, desc = 'list diagnostics' })
        nmap('gL', cmd 'Trouble workspace_diagnostics', { buffer = ev.buf, desc = 'list diagnostics' })

        nmap('gi', cmd 'Telescope lsp_implementations', { buffer = ev.buf, desc = 'lsp implementation' })
        nmap('gd', cmd 'Telescope lsp_definitions', { buffer = ev.buf, desc = 'lsp definition' })
        nmap('gD', cmd 'FzfLua lsp_declarations', { buffer = ev.buf, desc = 'lsp declaration' })

        nmap('gs', cmd 'Telescope lsp_document_symbols', { buffer = ev.buf, desc = 'document symbols' })

        nmap('<space>f', cmd 'Lspsaga lsp_finder', { buffer = ev.buf, desc = 'lsp finder' })
        nmap('<space>p', cmd 'Lspsaga peek_type_definition', { buffer = ev.buf, desc = 'lsp peek' })
        nmap('<leader>lo', cmd 'Lspsaga outline', { buffer = ev.buf, desc = 'lsp outline' })
    end,
})
