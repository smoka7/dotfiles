local M = {}

M.autopair = require 'nvim-autopairs.completion.cmp'

M.icons = {
    Array = '󰅪 ',
    Boolean = ' ',
    Class = '󰌗 ',
    Color = '',
    Constant = ' ',
    Constructor = ' ',
    Enum = '󰒻',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = '󰈙 ',
    Folder = ' ',
    Function = '󰊕 ',
    Interface = ' ',
    Key = '󰌋 ',
    Keyword = '廓',
    Macro = ' ',
    Method = ' ',
    Module = ' ',
    Namespace = '󰌗 ',
    Null = ' ',
    Number = '󰎠 ',
    Object = '󰅩 ',
    Operator = '󰆕 ',
    Package = '󰏖 ',
    Parameter = ' ',
    Property = '󰆧 ',
    Reference = '',
    Snippet = ' ',
    StaticMethod = '󰠄 ',
    String = '󰀬 ',
    Struct = '󰌗 ',
    Text = '󰉿 ',
    TypeAlias = ' ',
    TypeParameter = '󰊄 ',
    Unit = '󰉻 ',
    Value = ' ',
    Variable = ' ',
}

M.setup_cmp = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    cmp.event:on('confirm_done', M.autopair.on_confirm_done())

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        confirmation = { default_behavior = 'replace' },
        window = {
            --completion = cmp.config.window.bordered({ border = 'rounded' }),
            completion = { side_padding = 0 },
            documentation = cmp.config.window.bordered { border = 'rounded' },
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            expandable_indicator = true,
            format = function(_, vim_item)
                vim_item.menu = vim_item.kind
                vim_item.kind = ' ' .. M.icons[vim_item.kind] .. ' '

                return vim_item
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                    return
                end
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                    return
                end
                if has_words_before() then
                    cmp.complete()
                    return
                end
                fallback()
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<CR>'] = cmp.mapping.confirm { select = false },
        },
        sources = cmp.config.sources {
            { name = 'luasnip', group_index = 1 },
            { name = 'nvim_lsp', group_index = 2 },
            { name = 'buffer', group_index = 3 },
            { name = 'path', group_index = 3 },
            { name = 'spell', group_index = 3 },
        },
        experimental = {
            ghost_text = { hl_group = 'Comment' },
        },
    }

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
        },
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = 'cmdline' },
            { name = 'path' },
        },
    })
    local map = require('builtins.maps').map
    map({ 'n', 'i', 's' }, '<c-f>', function()
        if not require('noice.lsp').scroll(4) then
            return '<c-f>'
        end
    end, { silent = true, expr = true })

    map({ 'n', 'i', 's' }, '<c-b>', function()
        if not require('noice.lsp').scroll(-4) then
            return '<c-b>'
        end
    end, { silent = true, expr = true })
end
return M
