local U = {}

U.map = function(mode, l, r, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, l, r, opts)
end

U.buffer_not_empty = function()
	return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
end

U.check_git_workspace = function()
	local filepath = vim.fn.expand("%:p:h")
	local gitdir = vim.fn.finddir(".git", filepath .. ";")
	return gitdir and #gitdir > 0 and #gitdir < #filepath
end

return U
