vim.cmd([[packadd packer.nvim]])
local config = {
	-- compile_path = util.join_paths(vim.fn.stdpath("config"), "lua", "packer_compiled.lua"),
}
local fy = "go,html,json,css,vue,rs,js,ts,php,sh,fish,lua,vim"
return require("packer").startup(function(use)
	use("lewis6991/impatient.nvim")
	-- use("dstein64/vim-startuptime")
	---------------------------completion and snippert
	use({ "hrsh7th/cmp-nvim-lsp" })
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
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
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({})
			-- load refactoring Telescope extension
			require("telescope").load_extension("refactoring")
			vim.api.nvim_set_keymap(
				"v",
				"<leader>ls",
				"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
				{ noremap = true }
			)
		end,
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
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
	use({
		"booperlv/nvim-gomove",
		config = function()
			require("gomove").setup({
				map_defaults = true,
				reindent = true,
				undojoin = true,
				move_past_end_col = false,
				ignore_indent_lh_dup = true,
			})
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			require("_hop")
		end,
	})
	use("mg979/vim-visual-multi")
	use("famiu/bufdelete.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("_bufferline")
			require("_lualine")
		end,
	})
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
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				plugins = {
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
			})
		end,
	})
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
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
				indent_blankline_show_first_indent_level = false,
				filetype_exclude = { "NvimTree" },
			})
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "vim", "html" },
		config = function()
			require("colorizer").setup({ "css", "javascript", "vim", "html" })
		end,
		cmd = "ColorizerAttachToBuffer",
	})
	-- "auto rename tag
	use({
		"AndrewRadev/tagalong.vim",
		ft = {
			"eco",
			"eelixir",
			"ejs",
			"eruby",
			"html",
			"htmldjango",
			"javascriptreact",
			"jsx",
			"vue",
			"php",
			"typescriptreact",
			"xml",
		},
	})
	-- use {'rktjmp/lush.nvim', cmd = 'Lushify'}
	------------------------------ code
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("_lsp")
		end,
	})
	use({ "ray-x/lsp_signature.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/playground",
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"theHamsta/nvim-treesitter-pairs",
		},
		config = function()
			require("treesitter")
		end,
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
		config = function()
			require("neogen").setup({
				enabled = true,
			})
			local opts = { noremap = true, silent = true }
			require("utils").map("n", "<Leader>n", ":lua require('neogen').generate()<CR>", opts)
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({ "lambdalisue/suda.vim" })
	use({ "mattn/emmet-vim", opt = true, ft = "html,htm,php,vue" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		wants = { "popup.nvim", "plenary.nvim" },
		config = function()
			require("_telescope")
		end,
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
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("_comment")
		end,
	})
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
end, config)
