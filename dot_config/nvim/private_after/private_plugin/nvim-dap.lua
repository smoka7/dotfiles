-- local dap = require("dap")
-- local map = require("utils").map
-- map("n", "<F5>", function()
-- 	dap.continue()
-- end, { desc = "dap continue" })
-- map("n", "<F10>", function()
-- 	dap.step_over()
-- end, { desc = "dap step over" })
-- map("n", "<F11>", function()
-- 	dap.step_into()
-- end, { desc = "dap step into" })
-- map("n", "<F12>", function()
-- 	dap.step_out()
-- end, { desc = "dap step out" })
-- map("n", "<Leader>bb", function()
-- 	dap.toggle_breakpoint()
-- end, { desc = "toggle breakpoint" })
-- map("n", "<Leader>bo", function()
-- 	require("dapui").toggle()
-- end, { desc = "dapui toggle" })
-- map("n", "<leader>bl", function()
-- 	dap.run_last()
-- end, { desc = "dap run last" })
-- map("n", "<leader>bt", function()
-- 	dap.terminate()
-- end, { desc = "dap terminal" })
-- require("dapui").setup({
-- 	icons = { expanded = "▾", collapsed = "▸" },
-- 	mappings = { expand = { "<CR>", "<2-LeftMouse>" }, open = "o", remove = "d", edit = "e", repl = "r" },
-- 	layout = {
-- 		{
-- 			elements = {
-- 				{ id = "scopes", size = 0.25 },
-- 				{ id = "breakpoints", size = 0.25 },
-- 				{ id = "stacks", size = 0.25 },
-- 				{ id = "watches", size = 00.25 },
-- 			},
-- 			size = 40,
-- 			position = "left",
-- 		},
-- 		{ elements = { "repl" }, size = 10, position = "bottom" },
-- 	},
-- 	floating = {
-- 		max_height = nil,
-- 		max_width = nil,
-- 		mappings = { close = { "q", "<Esc>" } },
-- 	},
-- 	windows = { indent = 1 },
-- })
--
-- ---------go config
-- dap.adapters.go = function(callback, config)
-- 	local stdout = vim.loop.new_pipe(false)
-- 	local handle
-- 	local pid_or_err
-- 	local port = 38697
-- 	local opts = { stdio = { nil, stdout }, args = { "dap", "-l", "127.0.0.1:" .. port }, detached = true }
-- 	handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
-- 		stdout:close()
-- 		handle:close()
-- 		if code ~= 0 then
-- 			print("dlv exited with code", code)
-- 		end
-- 	end)
-- 	assert(handle, "Error running dlv: " .. tostring(pid_or_err))
-- 	stdout:read_start(function(err, chunk)
-- 		assert(not err, err)
-- 		if chunk then
-- 			vim.schedule(function()
-- 				require("dap.repl").append(chunk)
-- 			end)
-- 		end
-- 	end)
-- 	-- Wait for delve to start
-- 	vim.defer_fn(function()
-- 		callback({ type = "server", host = "127.0.0.1", port = port })
-- 	end, 100)
-- end
-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
-- 	{ type = "go", name = "Debug", request = "launch", program = "${file}" },
-- 	{
-- 		type = "go",
-- 		name = "Debug test", -- configuration for debugging test files
-- 		request = "launch",
-- 		mode = "test",
-- 		program = "${file}",
-- 	},
-- 	-- works with go.mod packages and sub packages
-- 	{
-- 		type = "go",
-- 		name = "Debug test (go.mod)",
-- 		request = "launch",
-- 		mode = "test",
-- 		program = "./${relativeFileDirname}",
-- 	},
-- }
