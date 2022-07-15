local hop = require("hop")
local map = require("utils").map

hop.setup({})
local cmdnf = function(dir, inclusive)
	package.loaded.hop.hint_char1({
		direction = dir,
		current_line_only = true,
		inclusive_jump = inclusive,
	})
end

map("n", "f", function()
	cmdnf(2, true)
end, {})
map("n", "F", function()
	cmdnf(1, true)
end, {})
map("o", "f", function()
	cmdnf(2, false)
end, {})
map("o", "F", function()
	cmdnf(1, false)
end, {})
-- map('o', 'y', function() cmdnf(2, true) end, {})
-- map('o', 'Y', function() cmdnf(1, true) end, {})
