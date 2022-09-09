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


vim.fn.sign_define("DiagnosticSignError", { text = "⛔", numhl = "DiagnosticSignErrorr" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "🚦", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "🚩", numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "💡", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("LspDiagnosticSignError", { text = "⛔", numhl = "DiagnosticSignErrorr" })
vim.fn.sign_define("LspDiagnosticSignWarn", { text = "🚦", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("LspDiagnosticSignInfo", { text = "🚩", numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("LspDiagnosticSignHint", { text = "💡", numhl = "DiagnosticSignHint" })
