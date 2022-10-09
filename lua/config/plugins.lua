return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("mhinz/vim-startify")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("natecraddock/telescope-zf-native.nvim")
	use("nvim-telescope/telescope-live-grep-args.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("shaunsingh/nord.nvim")
	use("https://gitlab.com/yorickpeterse/nvim-window.git")
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"stevearc/aerial.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("aerial").setup({})
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "rust", "typescript", "javascript", "tsx", "html" },
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
					filetypes = { "html", "typescriptreact", "javascriptreact", "htmldjango" },
				},
				playground = {
					enable = true,
				},
			})
		end,
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use({
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").init_lsp_saga({
				code_action_lightbulb = {
					virtual_text = false,
				},
			})
		end,
	})

	use({
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	})

	use("kylechui/nvim-surround")

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use({
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	})

	use("ziglang/zig.vim")

	use("anuvyklack/hydra.nvim")
	use("echasnovski/mini.nvim")
	use("numToStr/Comment.nvim")
	use("phaazon/hop.nvim")
	use("savq/melange")
	use("Mofiqul/vscode.nvim")
	use("sindrets/diffview.nvim")
	use("arkav/lualine-lsp-progress")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("simrat39/rust-tools.nvim")
	use("nvim-treesitter/nvim-treesitter-context")
	use("windwp/nvim-autopairs")
	use("sindrets/winshift.nvim")
	use("peitalin/vim-jsx-typescript")
	use({
		"nvim-neorg/neorg",
		config = function ()
			require("neorg").setup({})
		end,
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("nvim-treesitter/playground")
	use("emi2k01/material.nvim")
	use("b0o/schemastore.nvim")
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					insert_only = false,
				},
			})
		end,
	})
	use({
		"nanozuki/tabby.nvim",
	})
end)
