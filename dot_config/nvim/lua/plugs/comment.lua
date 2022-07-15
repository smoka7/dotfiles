local map = require("utils").map
local cm = require("Comment.api")

require("Comment").setup({
	pre_hook = function(ctx)
		local U = require("Comment.utils")
		local tsc = require("ts_context_commentstring.utils")
		local location = nil
		if ctx.ctype == U.ctype.block then
			location = tsc.get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = tsc.get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})

local function comment_it()
	if vim.v.count == 0 then
		cm.toggle_current_linewise()
		return
	end
	cm.toggle_linewise_count()
end

map({ "n", "i", "x" }, "<C-/>", function()
	comment_it()
end)
map({ "n", "i", "x" }, "", function()
	comment_it()
end)
map("x", "<C-/>", function()
	cm.toggle_linewise_visual()
end)
map("x", "", function()
	cm.toggle_linewise_visual()
end)
