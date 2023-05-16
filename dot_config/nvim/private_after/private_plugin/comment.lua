local map = require('builtins.maps')
local inmap = require('builtins.maps').inmap
local xmap = require('builtins.maps').xmap
local cm = require('Comment')
local api = require('Comment.api')
local ft = require('Comment.ft')

ft.set('lua', { '-- %s', '--%s' })

cm.setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

local function comment_it()
    if vim.v.count == 0 then
        api.toggle.linewise.current(nil, {})
        return
    end
    api.toggle.linewise.count(vim.v.count, {})
end

inmap('<C-/>', function()
    comment_it()
end)
inmap('', function()
    comment_it()
end)
xmap('<C-/>', '<Plug>(comment_toggle_linewise_visual)')
xmap('', '<Plug>(comment_toggle_linewise_visual)')
