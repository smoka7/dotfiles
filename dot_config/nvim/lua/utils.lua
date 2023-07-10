local U = {}

--- returns true if buffer isn't empty
---@return boolean
U.buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

--- returns true if win size is small
---@return boolean
U.hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

--- returns if the current dir is a gitdir
---@return boolean
U.check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
end

U.root_patterns = { ".git", "lua" }
-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
U.get_root = function()
    ---@type string?
    local path = vim.api.nvim_buf_get_name(0)
    path = path ~= '' and vim.uv.fs_realpath(path) or nil
    ---@type string[]
    local roots = {}
    if path then
        for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            local workspace = client.config.workspace_folders
            local paths = workspace
                    and vim.tbl_map(function(ws)
                        return vim.uri_to_fname(ws.uri)
                    end, workspace)
                or client.config.root_dir and { client.config.root_dir }
                or {}
            for _, p in ipairs(paths) do
                local r = vim.uv.fs_realpath(p)
                if path:find(r, 1, true) then
                    roots[#roots + 1] = r
                end
            end
        end
    end
    table.sort(roots, function(a, b)
        return #a > #b
    end)
    ---@type string?
    local root = roots[1]
    if not root then
        path = path and vim.fs.dirname(path) or vim.uv.cwd()
        ---@type string?
        root = vim.fs.find(U.root_patterns, { path = path, upward = true })[1]
        root = root and vim.fs.dirname(root) or vim.uv.cwd()
    end
    ---@cast root string
    return root
end

return U
