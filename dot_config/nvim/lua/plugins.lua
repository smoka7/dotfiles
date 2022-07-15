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
	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
	---------------------------completion and snippet
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "f3fora/cmp-spell", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			-- { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
		},
	})
	-- use({ 'rafamadriz/friendly-snippets' })
	use({ "~/gits/friendly-snippets" })
	use({ "L3MON4D3/LuaSnip" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup({
				direction = "tab",
				highlights = {
					Normal = {
						guibg = "#1b222D",
					},
				},
				shade_terminals = false,
			})
		end,
	})
	----------------------------language helpers
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("plugs.debugger")
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
		end,
		ft = fy,
	})
	use({
		"vim-test/vim-test",
		opt = true,
		ft = fy,
		config = function()
			require("plugs.tests")
		end,
	})
	use({
		"ray-x/go.nvim",
		opt = true,
		ft = "go",
		config = function()
			require("go").setup()
		end,
	})
	----------------------------color scheme
	use({
		"~/celeste-nvim",
		"~/gits/neolara",
		{
			"~/gits/catppuccin",
			as = "catppuccin",
		},
	})
	use({
		"~/gits/textobj-diagnostic.nvim",
		config = function()
			require("textobj-diagnostic").setup()
		end,
	})
	----------------------------file
	use({ "famiu/bufdelete.nvim" })
	use({
		"akinsho/nvim-bufferline.lua",
		tag = "*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "hoob3rt/lualine.nvim" })
	use({ "fgheng/winbar.nvim" })
	use({ "nvim-neo-tree/neo-tree.nvim", requires = "MunifTanjim/nui.nvim" })
	-- use({ "~/gits/neo-tree.nvim", requires = "MunifTanjim/nui.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	---------------------------- ui niceties
	use({ "folke/which-key.nvim" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugs.gitsign")
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
	use({ "booperlv/nvim-gomove" })
	use({ "phaazon/hop.nvim" })
	-- "auto rename tag
	use("mg979/vim-visual-multi")
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
	------------------------------ code
	use({ "neovim/nvim-lspconfig" })
	use({ "ray-x/lsp_signature.nvim" })
	use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
	use("ziontee113/syntax-tree-surfer")
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
		"~/gits/nvim-treesitter-textsubjects",
		-- 'RRethy/nvim-treesitter-textsubjects',
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
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
		-- 'danymat/neogen',
		"~/gits/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({ "lambdalisue/suda.vim" })
	use({
		"ibhagwan/fzf-lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope.nvim",
		wants = { "plenary.nvim" },
	})
	use({ "mbbill/undotree", cmd = "UndotreeToggle", config = [[vim.g.undotree_SetFocusWhenToggle = 1]] })
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
end)
