local hop = require('hop')
local map = require('builtins.maps').map

hop.setup({})
-- local cmdnf = function(dir, hint_offset, current_line_only)
--     package.loaded.hop.hint_char1({
--         direction = dir,
--         hint_offset = hint_offset,
--         current_line_only = current_line_only,
--     })
-- end

-- map({ "n", "o" }, "s", function()
-- 	cmdnf(2, 0, false)
-- end, {})
-- map({ "n", "o" }, "S", function()
-- 	cmdnf(1, 0, false)
-- end, {})

map({ 'n' }, '<Leader>o', '<cmd>HopYank<cr>')
map({ 'o', 'n' }, 'j', '<cmd>HopLineAC<cr>')
map({ 'o', 'n' }, 'k', '<cmd>HopLineBC<cr>')
map({ 'o', 'n' }, 't', '<cmd>HopChar1CurrentLineAC<cr>')
map({ 'o', 'n' }, 'T', '<cmd>HopChar1CurrentLineBC<cr>')
map({ 'o', 'n' }, 'f', '<cmd>HopChar1AC<cr>')
map({ 'o', 'n' }, 'F', '<cmd>HopChar1BC<cr>')

-- map({ 'o' }, 'f', function()
--     cmdnf(2, -1, true)
-- end, {})
--
-- map({ 'o' }, 'F', function()
--     cmdnf(1, -1, true)
-- end, {})
--
-- map({ 'n' }, 'f', function()
--     cmdnf(2, 0, true)
-- end, {})
--
-- map({ 'n' }, 'F', function()
--     cmdnf(1, 0, true)
-- end, {})

-- map('o', 'y', function() cmdnf(2, true) end, {})
-- map('o', 'Y', function() cmdnf(1, true) end, {})
