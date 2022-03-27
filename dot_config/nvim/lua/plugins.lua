vim.cmd([[packadd packer.nvim]])

local fy = { "go", "html", "json", "css", "vue", "rs", "js", "ts", "php", "sh", "fish", "lua", "vim" }

local packer = require("packer")
packer.init({
	compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	-- profile = {
	-- 	enable = true,
	-- 	threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	-- },
})
local use = packer.use
return packer.startup(function()
	use("lewis6991/impatient.nvim")
	use("dstein64/vim-startuptime")
	---------------------------completion and snippert
	use({ "hrsh7th/cmp-nvim-lsp" })
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("github/copilot.vim")
	use("hrsh7th/cmp-cmdline")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/nvim-cmp")
	----------------------------language helpers
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("debugger")
		end,
		ft = "go",
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, ft = "go", after = "nvim-dap" })
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({})
			require("telescope").load_extension("refactoring")
			vim.api.nvim_set_keymap(
				"v",
				"<leader>ls",
				"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
				{ noremap = true }
			)
		end,
		ft = fy,
	})
	use({ "buoto/gotests-vim", opt = true, ft = "go" })
	use({ "vim-test/vim-test", opt = true, ft = fy })
	use({ "fatih/vim-go", opt = true, ft = "go" })
	use({ "phpactor/phpactor", opt = true, ft = "php" })
	----------------------------colorscheme
	use({
		"~/celeste-nvim",
		"folke/tokyonight.nvim",
	})
	----------------------------file
	use({ "booperlv/nvim-gomove" })
	use({ "phaazon/hop.nvim" })
	use("mg979/vim-visual-multi")
	use("famiu/bufdelete.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "hoob3rt/lualine.nvim" })
	use("kyazdani42/nvim-web-devicons")
	---------------------------- ui niceties
	use({
		"folke/twilight.nvim",
		"folke/zen-mode.nvim",
		config = function()
			require("twilight").setup({})
			require("zen-mode").setup({})
		end,
		cmd = "Twilight,ZenMode",
	})
	use({ "folke/which-key.nvim" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("_gitsign")
		end,
	})
	use({
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neogit").setup({})
		end,
		cmd = "Neogit",
	})
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "vim", "html" },
		config = function()
			require("colorizer").setup()
		end,
		cmd = "ColorizerAttachToBuffer",
	})
	use({ "mattn/emmet-vim", opt = true, ft = fy })
	-- "auto rename tag
	use({
		"AndrewRadev/tagalong.vim",
		ft = {
			"html",
			"jsx",
			"vue",
			"php",
			"xml",
		},
	})
	-- use {'rktjmp/lush.nvim', cmd = 'Lushify'}
	------------------------------ code
	use({
		"neovim/nvim-lspconfig",
	})
	use({ "ray-x/lsp_signature.nvim" })
	use("nvim-treesitter/playground")
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"theHamsta/nvim-treesitter-pairs",
		},
	})
	use({
		"theHamsta/nvim-treesitter-pairs",
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
		ft = fy,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"~/gits/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({ "lambdalisue/suda.vim" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/popup.nvim" },
		wants = { "popup.nvim", "plenary.nvim" },
	})
	use({ "mbbill/undotree", cmd = "UndotreeToggle", config = [[vim.g.undotree_SetFocusWhenToggle = 1]] })
	use("Raimondi/delimitMate")
	use({
		"sbdchd/neoformat",
		config = function()
			vim.cmd([[so ~/.config/nvim/lua/neoformat.vim]])
		end,
		cmd = "Neoformat",
	})
	use("numToStr/Comment.nvim")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
end)
