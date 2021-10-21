local on_attach = function(client, bufnr)
    require"lsp_signature".on_attach(
    {
        handler_opts = {
            border = "double" -- double, single, shadow, none
        }
    }
    )
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', '<Leader>ld', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<Leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leaderla', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<Leader>d', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<Leader><space>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.sp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<Leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<Leader>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>ll', '<cmd>Telescope lsp_document_diagnostics<CR>', opts)

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
        [[
	  augroup lsp_document_highlight
	  autocmd! * <buffer>
	  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	  augroup END
	  ]], false
        )
    end
end
-- local coq = require "coq"
-- coq.lsp_ensure_capabilities()
-- config that activates keymaps and enables snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}
-- lsp-install
local function setup_servers()
    local servers = {
        'bashls',
        'cssls',
        'emmet_ls',
        'gopls',
        'html',
        'intelephense',
        'jsonls',
        'tailwindcss',
        'tsserver',
        'vimls',
        'vuels'
    }
    local nvim_lsp = require 'lspconfig'
    nvim_lsp.html.setup {filetypes = {"php", "vue", "html"}}
    nvim_lsp.emmet_ls.setup {filetypes = {"php", "vue", "html"}}
    -- nvim_lsp.tsserver.setup {
    --     filetypes = {
    --         "javascript",
    --         "js",
    --         "vue",
    --         "javascriptreact",
    --         "javascript.jsx",
    --         "typescript",
    --         "typescriptreact",
    --         "typescript.tsx"
    --     }
    -- }
    for _, server in pairs(servers) do nvim_lsp[server].setup {on_attach = on_attach, capabilities = capabilities} end
end
local runtime_path = vim.split(package.path, ';')
require'lspconfig'.sumneko_lua.setup {
    cmd = {'/usr/bin/lua-language-server'},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = runtime_path},
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim', 'love'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    },
    on_attach = on_attach,
    capabilities = capabilities
}

setup_servers()
vim.g.coq_settings = {auto_start = 'shut-up'}
require('coq')

-- treesitter
--
--
--
require'nvim-treesitter.configs'.setup {
    refactor = {smart_rename = {enable = true, keymaps = {smart_rename = "grr"}}},
    highlight = {enable = true, custom_captures = {}},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    indent = {enable = true},
    textobjects = {
        enable = true,
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"

            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer'},
            goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer'},
            goto_previous_start = {['[m'] = '@function.outer', ['[['] = '@class.outer'},
            goto_previous_end = {['[M'] = '@function.outer', ['[]'] = '@class.outer'}
        },
        swap = {
            enable = true,
            swap_next = {["<leader>a"] = "@parameter.inner"},
            swap_previous = {["<leader>A"] = "@parameter.inner"}
        }
    }
}

