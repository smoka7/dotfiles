local nullLs = require("null-ls")

nullLs.setup({
	sources = {
		-- nullLs.builtins.code_actions.eslint_d,
		-- nullLs.builtins.diagnostics.eslint_d,
		nullLs.builtins.diagnostics.write_good,
		nullLs.builtins.formatting.fish_indent,
		nullLs.builtins.formatting.eslint_d,
		nullLs.builtins.formatting.gofumpt,
	},
})
