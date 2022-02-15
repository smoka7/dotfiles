require("hop").setup({})
local map = require("utils").map

local cmdnf = function(dir, inclusive)
	return "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection."
		.. dir
		.. " , current_line_only = false, inclusive_jump = "
		.. inclusive
		.. "  })<cr>"
end

map("n", "f", cmdnf("AFTER_CURSOR", "true"), {})
map("n", "F", cmdnf("BEFORE_CURSOR", "true"), {})
map("o", "f", cmdnf("AFTER_CURSOR", "false"), {})
map("o", "F", cmdnf("BEFORE_CURSOR", "false"), {})
