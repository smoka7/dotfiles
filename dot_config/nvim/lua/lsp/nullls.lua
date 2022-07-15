local nullLs = require("null-ls")
local h = require("null-ls.helpers")
local FORMATTING = "NULL_LS_FORMATTING"
local RANGE_FORMATTING = "NULL_LS_RANGE_FORMATTING"

local selene = nullLs.builtins.diagnostics.selene
local prettier = h.make_builtin({
	name = "prettier",
	method = { FORMATTING, RANGE_FORMATTING },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"css",
		"scss",
		"less",
		"html",
		"json",
		"jsonc",
		"yaml",
		"markdown",
		"graphql",
		"handlebars",
	},
	generator_opts = {
		command = "prettier",
		args = h.range_formatting_args_factory({
			"--stdin-filepath",
			"$FILENAME",
			"--plugin",
			"prettier-plugin-tailwindcss",
		}, "--range-start", "--range-end", { row_offset = -1, col_offset = -1 }),
		to_stdin = true,
	},
	factory = h.formatter_factory,
})

selene.args = { "--display-style", "quiet", "-", "--config", "~/.config/selene/selene.toml" }

nullLs.setup({
	debug = true,
	sources = {
		nullLs.builtins.formatting.fish_indent,
		nullLs.builtins.formatting.gofumpt,
		nullLs.builtins.formatting.pint,
		nullLs.builtins.formatting.stylua,
		prettier,
		selene,
		-- nullLs.builtins.formatting.phpcbf,
		-- nullLs.builtins.formatting.eslint_d,
		-- nullLs.builtins.diagnostics.phpmd,
		-- nullLs.builtins.diagnostics.vale,
		-- nullLs.builtins.diagnostics.phpstan,
		-- nullLs.builtins.code_actions.eslint_d,
	},
})

vim.api.nvim_create_user_command("EslintD", function()
	if nullLs.is_registered(nullLs.builtins.diagnostics.eslint_d) then
		nullLs.deregister(nullLs.builtins.diagnostics.eslint_d)
	else
		nullLs.register(nullLs.builtins.diagnostics.eslint_d)
	end
end, {})
