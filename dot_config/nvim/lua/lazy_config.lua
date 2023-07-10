local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    }
end

vim.opt.runtimepath:prepend(lazypath)

local opts = {
    defaults = { lazy = false },
    git = {
        log = { '-5' },
    },
    dev = {
        path = '~/gits/',
    },
    change_detection = {
        enabled = false,
    },
    readme = { enabled = false },
    performance = {
        rtp = {
            disabled_plugins = {
                'tohtml',
                'getscript',
                'getscriptPlugin',
                'gzip',
                'logiPat',
                --'matchit',
                --'matchparen',
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
require('lazy').setup('plugins', opts)
