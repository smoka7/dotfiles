local M = {}

M.opts = { noremap = true, silent = true }

local function check_opts(opts)
    if opts == nil then
        opts = M.opts
    elseif next(opts) == nil then
        opts = {}
    else
        opts = vim.tbl_extend('force', M.opts, opts)
    end
    return opts
end

---@param mode string|table
---@param l string
---@param r string|function
---@param opts table?
M.map = function(mode, l, r, opts)
    vim.keymap.set(mode, l, r, check_opts(opts))
end

--- adds a mapping in normal mode
---@param l string
---@param r string|function
---@param opts table
M.nmap = function(l, r, opts)
    M.map('n', l, r, opts)
end

---returns the string wraped in a vim cmd
---@param cmd string
---@return string
M.cmd = function(cmd)
    return '<cmd>' .. cmd .. '<cr>'
end

M.imap = function(l, r, opts)
    M.map('i', l, r, opts)
end

M.inmap = function(l, r, opts)
    M.map({ 'i', 'n' }, l, r, opts)
end

M.xmap = function(l, r, opts)
    M.map('x', l, r, opts)
end

M.vmap = function(l, r, opts)
    M.map('v', l, r, opts)
end

return M
