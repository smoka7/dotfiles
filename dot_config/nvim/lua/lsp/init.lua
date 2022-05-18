require("lsp.servers")
require("lsp.mappings")
require("lsp.cmp")
require("lsp.nullls")

vim.diagnostic.config({
	underline = true,
	float = {
		show_header = false,
		source = true,
		focus = false,
		width = 60,
	},
	virtual_text = { source = false, spacing = 2 },
	-- virtual_text = {
	-- 	severity = "error",
	-- },
})
