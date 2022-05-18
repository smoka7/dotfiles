vim.cmd([[packadd packer.nvim]])

local fy = { 'go', 'html', 'json', 'css', 'vue', 'rs', 'js', 'ts', 'php', 'sh', 'fish', 'lua', 'vim' }

local packer = require('packer')
packer.init({
  compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
  -- profile = {
  -- 	enable = true,
  -- 	threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  -- },
})
local use = packer.use
return packer.startup(function()
  use('lewis6991/impatient.nvim')
  use('dstein64/vim-startuptime')
  ---------------------------completion and snippet
  use({ 'hrsh7th/nvim-cmp' })
  use({ 'hrsh7th/cmp-path' })
  use({ 'hrsh7th/cmp-buffer' })
  use({ 'hrsh7th/cmp-copilot' })
  use({ 'hrsh7th/cmp-cmdline' })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'saadparwaiz1/cmp_luasnip' })
  use({ 'rafamadriz/friendly-snippets' })
  use({ 'L3MON4D3/LuaSnip' })
  use({ 'github/copilot.vim' })
  ----------------------------language helpers
  use({
    'mfussenegger/nvim-dap',
    config = function()
      require('plugs.debugger')
    end,
    ft = 'go',
  })
  use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' }, ft = 'go', after = 'nvim-dap' })
  use({
    'ThePrimeagen/refactoring.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
      require('refactoring').setup({})
      require('telescope').load_extension('refactoring')
    end,
    ft = fy,
  })
  use({ 'buoto/gotests-vim', opt = true, ft = 'go' })
  use({ 'vim-test/vim-test', opt = false })
  -- use({ "vim-test/vim-test"})
  use({ 'fatih/vim-go', opt = true, ft = 'go' })
  use({ 'phpactor/phpactor', opt = true, ft = 'php' })
  ----------------------------color scheme
  use({
    '~/celeste-nvim',
    'folke/tokyonight.nvim',
  })
  ----------------------------file
  use('famiu/bufdelete.nvim')
  use({
    'akinsho/nvim-bufferline.lua',
    tag = '*',
    requires = 'kyazdani42/nvim-web-devicons',
  })
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  })
  use({ 'hoob3rt/lualine.nvim' })
  use('kyazdani42/nvim-web-devicons')
  ---------------------------- ui niceties
  use({
    'folke/twilight.nvim',
    'folke/zen-mode.nvim',
    config = function()
      require('twilight').setup({})
      require('zen-mode').setup({})
    end,
    cmd = 'Twilight,ZenMode',
  })
  use({ 'folke/which-key.nvim' })
  use({
    -- "lewis6991/satellite.nvim",
    '~/gits/satellite.nvim',
    config = function()
      require('satellite').setup({
        current_only = false,
        winblend = 70,
        zindex = 40,
        excluded_filetypes = {},
        width = 1,
        handlers = {
          search = {
            enable = false,
          },
          marks = {
            enable = true,
            show_builtins = false,
          },
          diagnostic = {
            enable = true,
          },
          gitsigns = {
            enable = true,
            highlight = {
              add = 'TSMethod',
              delete = 'TSTag',
              change = 'TSKeyword',
            },
          },
        },
      })
    end,
  })
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugs.gitsign')
    end,
  })
  use({
    'TimUntersberger/neogit',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('neogit').setup({})
    end,
    cmd = 'Neogit',
  })
  use({ 'lukas-reineke/indent-blankline.nvim' })
  use({
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'vim', 'html' },
    config = function()
      require('colorizer').setup()
    end,
    cmd = 'ColorizerAttachToBuffer',
  })
  use({ 'mattn/emmet-vim', opt = true, ft = fy })
  -- use({ "~/gits/nvim-gomove" })
  use({ 'booperlv/nvim-gomove' })
  use({ 'phaazon/hop.nvim' })
  -- "auto rename tag
  use('mg979/vim-visual-multi')
  use({
    'AndrewRadev/tagalong.vim',
    ft = {
      'html',
      'jsx',
      'vue',
      'php',
      'xml',
    },
  })
  ------------------------------ code
  use({
    'neovim/nvim-lspconfig',
  })
  use({ 'ray-x/lsp_signature.nvim' })
  use('nvim-treesitter/playground')
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'theHamsta/nvim-treesitter-pairs',
    },
  })
  use({
    'theHamsta/nvim-treesitter-pairs',
    'RRethy/nvim-treesitter-textsubjects',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
  })
  use({
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup({})
    end,
    ft = fy,
  })
  use('jose-elias-alvarez/null-ls.nvim')
  use({
    'danymat/neogen',
    requires = 'nvim-treesitter/nvim-treesitter',
  })
  use({
    'SmiteshP/nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
  })
  use({ 'lambdalisue/suda.vim' })
  use({
    'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('fzf-lua').setup({
        winopts = {
          border = false,
          hl = {
            normal = 'Normal', -- window normal color (fg+bg)
            border = 'Normal', -- border color (try 'FloatBorder')
            cursor = 'Cursor', -- cursor highlight (grep/LSP matches)
            cursorline = 'CursorLine', -- cursor line
            search = 'Search', -- search matches (ctags)
            -- title       = 'Normal',        -- preview border title (file/buffer)
            -- scrollbar_f = 'PmenuThumb',    -- scrollbar "full" section highlight
            -- scrollbar_e = 'PmenuSbar',     -- scrollbar "empty" section highlight
          },
        },
      })
    end,
  })
  use({
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope.nvim',
    wants = { 'plenary.nvim' },
  })
  use({ 'mbbill/undotree', cmd = 'UndotreeToggle', config = [[vim.g.undotree_SetFocusWhenToggle = 1]] })
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end,
  })
  use({
    'sbdchd/neoformat',
    config = function()
      require('plugs.neoformat')
    end,
    cmd = 'Neoformat',
  })
  use('numToStr/Comment.nvim')
  use('tpope/vim-repeat')
  use('tpope/vim-surround')
end)
