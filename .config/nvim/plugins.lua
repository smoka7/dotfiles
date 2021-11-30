vim.cmd([[packadd packer.nvim]])
local config = {
	profile = {
		enable = true,
		threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	},
}

return require("packer").startup(function(use)
	-- use({ "ms-jpq/coq_nvim", { branch = "coq" } })
	-- use({ "ms-jpq/coq.artifacts", { branch = "artifacts" } })
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/vim-vsnip")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
	-- use("hrsh7th/vim-vsnip-integ")
	use("rafamadriz/friendly-snippets")
	use({ "hrsh7th/nvim-cmp" })
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "~/celeste-nvim" })
	use({ "akinsho/nvim-bufferline.lua", "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	use("kyazdani42/nvim-web-devicons")
	use({ "buoto/gotests-vim", ft = "go" })
	use({ "vim-test/vim-test", ft = "go,php" })
	use({ "phpactor/phpactor", ft = "php" })
	use({ "fatih/vim-go", ft = "go" })
	use("windwp/windline.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("folke/tokyonight.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	})
	-- "auto rename tag
	use("AndrewRadev/tagalong.vim")
	-- use {'rktjmp/lush.nvim', cmd = 'Lushify'}
	use("lukas-reineke/indent-blankline.nvim")
	use({ "neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { "nvim-treesitter/nvim-treesitter-refactor", "nvim-treesitter/nvim-treesitter-textobjects" },
	})
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-gps").setup()
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter-refactor", "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "lambdalisue/suda.vim" })
	use("luochen1990/rainbow")
	use({ "mattn/emmet-vim", opt = true, ft = "html,htm,php,vue" })
	use("mg979/vim-visual-multi")
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "vim", "html" },
		config = function()
			require("colorizer").setup({ "css", "javascript", "vim", "html" })
		end,
		cmd = "ColorizerAttachToBuffer",
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		wants = { "popup.nvim", "plenary.nvim" },
	})
	use({ "mbbill/undotree", cmd = "UndotreeToggle", config = [[vim.g.undotree_SetFocusWhenToggle = 1]] })
	use("Raimondi/delimitMate")
	use({ "sbdchd/neoformat" })
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("yashguptaz/calvera-dark.nvim")
	use("hoob3rt/lualine.nvim")
end, config)
