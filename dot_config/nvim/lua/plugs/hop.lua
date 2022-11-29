local hop = require("hop")
local map = require("utils").map

hop.setup({})
local cmdnf = function(dir, hint_offset, current_line_only)
	package.loaded.hop.hint_char1({
		direction = dir,
		hint_offset = hint_offset,
		current_line_only = current_line_only,
	})
end

-- map({ "n", "o" }, "s", function()
-- 	cmdnf(2, 0, false)
-- end, {})
-- map({ "n", "o" }, "S", function()
-- 	cmdnf(1, 0, false)
-- end, {})

map({ "n", "o" }, "f", function()
	cmdnf(2, -1, true)
end, {})

map({ "n", "o" }, "F", function()
	cmdnf(1, -1, true)
end, {})
-- map('o', 'y', function() cmdnf(2, true) end, {})
-- map('o', 'Y', function() cmdnf(1, true) end, {})
