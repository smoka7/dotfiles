local M = {}

local def_opts = { noremap = true, silent = true }

M.map = function(mode, l, r, opts)
    if opts ~= nil then
        opts = vim.tbl_extend('keep', opts, def_opts)
    else
        opts = def_opts
    end

    vim.keymap.set(mode, l, r, opts)
end

M.nmap = function(l, r, opts)
    M.map('n', l, r, opts)
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
