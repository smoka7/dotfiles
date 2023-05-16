local opts = { buffer = true }

vim.keymap.set({ 'n' }, '<space>lt', ':GoAddTest<cr>', opts)
vim.keymap.set({ 'n' }, '<space>le', ':GoIfErr<cr>', opts)
vim.keymap.set({ 'n' }, '<space>lr', ':GoGenReturn<cr>', opts)
vim.keymap.set({ 'n' }, '<space>li', ':GoImpl<cr>', opts)
vim.keymap.set({ 'n' }, '<space>lc', ':GoCoverage -t<cr>', opts)
vim.keymap.set({ 'n' }, '<space>lf', ':GoFillStruct<cr>', opts)

if vim.g.my_filetype_go_loaded then
    return
end
vim.g.my_filetype_go_loaded = true

vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        require('go.format').goimport()
    end,
    pattern = '*.go',
})
require('go').setup()
