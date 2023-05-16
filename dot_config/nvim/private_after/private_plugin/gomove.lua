local smart = require('gomove.mappings.smart')
local base = require('gomove.mappings.base')

--
-- -- moving lines up and down
require('gomove').setup({
    map_smart = false,
    reindent = true,
    undojoin = true,
    move_past_end_col = false,
    ignore_indent_lh_dup = true,
})

local function smUp()
    smart.NormalUp(false, vim.v.count1)
end
local function smDown()
    smart.NormalDown(false, vim.v.count1)
end

vim.keymap.set({ 'i', 'n' }, '<S-Down>', smDown)
vim.keymap.set({ 'n', 'i' }, '<S-Up>', smUp)
vim.keymap.set({ 'x' }, '<S-Up>', '<Plug>GoVMLineUp')
vim.keymap.set({ 'x' }, '<S-Down>', '<Plug>GoVMLineDown')
vim.keymap.set({ 'x' }, '<S-Left>', '<Plug>GoVSMLeft')
vim.keymap.set({ 'x' }, '<S-Right>', '<Plug>GoVSMRight')
