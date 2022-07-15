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

vim.cmd([[
	sign define DiagnosticSignError text=⛔ texthl= linehl= numhl=DiagnosticSignError
	sign define DiagnosticSignWarn text=🚦 texthl= linehl= numhl=DiagnosticSignWarn
	sign define DiagnosticSignInfo text=🚩 texthl= linehl= numhl=DiagnosticSignInfo
	sign define DiagnosticSignHint text=💡 texthl= linehl= numhl=DiagnosticSignHint
]])
