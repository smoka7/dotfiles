local map = require("utils").map
local cm = require("Comment")
local api = require("Comment.api")
local ft = require("Comment.ft")
ft.set("lua", { "-- %s", "--%s" })
cm.setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

local function comment_it()
	if vim.v.count == 0 then
		api.toggle.linewise.current(nil, {})
		return
	end
	api.toggle.linewise.count(vim.v.count, {})
end

map({ "n", "i" }, "<C-/>", function()
	comment_it()
end)
map({ "n", "i" }, "", function()
	comment_it()
end)
map("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)")
map("x", "", "<Plug>(comment_toggle_linewise_visual)")
