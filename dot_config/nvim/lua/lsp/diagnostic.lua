vim.diagnostic.config({
	underline = false,
	float = {
		show_header = false,
		source = true,
		focus = false,
		width = 60,
	},
	virtual_text = { source = false, spacing = 2, severity = "error" },
})

vim.api.nvim_create_user_command("HideAll", function()
	vim.diagnostic.reset()
end, {})

vim.fn.sign_define("DiagnosticSignError", { text = "●", texthl = "DiagnosticSignError", culhl = "CursorLine" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "●", texthl = "DiagnosticSignWarn", culhl = "CursorLine" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "●", texthl = "DiagnosticSignInfo", culhl = "CursorLine" })
vim.fn.sign_define("DiagnosticSignHint", { text = "●", texthl = "DiagnosticSignHint", culhl = "CursorLine" })

