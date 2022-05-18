-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/smoka/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/smoka/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/smoka/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/smoka/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/smoka/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["celeste-nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/celeste-nvim",
    url = "/home/smoka/celeste-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-copilot"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/cmp-copilot",
    url = "https://github.com/hrsh7th/cmp-copilot"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fwinopts\1\0\0\ahl\1\0\5\vborder\vNormal\15cursorline\15CursorLine\vsearch\vSearch\vnormal\vNormal\vcursor\vCursor\1\0\1\vborder\1\nsetup\ffzf-lua\frequire\0" },
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugs.gitsign\frequire\0" },
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gotests-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/gotests-vim",
    url = "https://github.com/buoto/gotests-vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugs.neoformat\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neogen = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerAttachToBuffer" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugs.debugger\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-gomove"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-gomove",
    url = "https://github.com/booperlv/nvim-gomove"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-treesitter-pairs",
    url = "https://github.com/theHamsta/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  phpactor = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/phpactor",
    url = "https://github.com/phpactor/phpactor"
  },
  playground = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\nn\0\0\3\0\5\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\16refactoring\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["satellite.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\6\0005\4\5\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\14\4=\4\15\3=\3\16\2B\0\2\1K\0\1\0\rhandlers\rgitsigns\14highlight\1\0\3\vdelete\nTSTag\badd\rTSMethod\vchange\14TSKeyword\1\0\1\venable\2\15diagnostic\1\0\1\venable\2\nmarks\1\0\2\18show_builtins\1\venable\2\vsearch\1\0\0\1\0\1\venable\1\23excluded_filetypes\1\0\4\nwidth\3\1\rwinblend\3F\vzindex\3(\17current_only\1\nsetup\14satellite\frequire\0" },
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/satellite.nvim",
    url = "/home/smoka/gits/satellite.nvim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["tagalong.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/tagalong.vim",
    url = "https://github.com/AndrewRadev/tagalong.vim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "vim.g.undotree_SetFocusWhenToggle = 1" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/smoka/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugs.gitsign\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fwinopts\1\0\0\ahl\1\0\5\vborder\vNormal\15cursorline\15CursorLine\vsearch\vSearch\vnormal\vNormal\vcursor\vCursor\1\0\1\vborder\1\nsetup\ffzf-lua\frequire\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: satellite.nvim
time([[Config for satellite.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\6\0005\4\5\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\14\4=\4\15\3=\3\16\2B\0\2\1K\0\1\0\rhandlers\rgitsigns\14highlight\1\0\3\vdelete\nTSTag\badd\rTSMethod\vchange\14TSKeyword\1\0\1\venable\2\15diagnostic\1\0\1\venable\2\nmarks\1\0\2\18show_builtins\1\venable\2\vsearch\1\0\0\1\0\1\venable\1\23excluded_filetypes\1\0\4\nwidth\3\1\rwinblend\3F\vzindex\3(\17current_only\1\nsetup\14satellite\frequire\0", "config", "satellite.nvim")
time([[Config for satellite.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerAttachToBuffer lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerAttachToBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'tagalong.vim'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim', 'tagalong.vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'tagalong.vim'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType ts ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'refactoring.nvim', 'phpactor', 'emmet-vim', 'fidget.nvim', 'tagalong.vim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'refactoring.nvim', 'gotests-vim', 'emmet-vim', 'fidget.nvim', 'nvim-dap-ui', 'nvim-dap', 'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim', 'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim', 'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim', 'nvim-colorizer.lua', 'tagalong.vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'refactoring.nvim', 'emmet-vim', 'fidget.nvim'}, { ft = "json" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/smoka/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/smoka/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/smoka/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
