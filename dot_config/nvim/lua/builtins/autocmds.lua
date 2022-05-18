local id = vim.api.nvim_create_augroup("packer", {
	clear = true,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source %",
	pattern = "{init,mappings,defaults}.lua",
	group = id,
})

vim.api.nvim_create_autocmd("BufEnter", {
	command = "source <afile>",
	pattern = "plugins.lua",
	group = id,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	pattern = "plugins.lua",
	group = id,
})
