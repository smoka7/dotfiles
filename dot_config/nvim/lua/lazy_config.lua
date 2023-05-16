local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

local opts = {
    defaults = { lazy = false },
    git = {
        log = { '-10' },
    },
    dev = {
        path = '~/gits/',
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'tohtml',
                'getscript',
                'getscriptPlugin',
                'gzip',
                'logiPat',
                'matchit',
                'matchparen',
                'netrw',
                'netrwFileHandlers',
                'netrwPlugin',
                'netrwSettings',
                'rrhelper',
                'tar',
                'tarPlugin',
                'vimball',
                'vimballPlugin',
                'zip',
                'zipPlugin',
            },
        },
    },
}
local plugins = require('plugins').plugins
require('lazy').setup(plugins, opts)
