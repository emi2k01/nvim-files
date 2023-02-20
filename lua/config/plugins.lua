return require("lazy").setup({
	"wbthomason/packer.nvim",
	"mhinz/vim-startify",
	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	"natecraddock/telescope-zf-native.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"emi2k01/nord.nvim",
	"https://gitlab.com/yorickpeterse/nvim-window.git",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
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
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	},
	"nvim-telescope/telescope-file-browser.nvim",
	"yioneko/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
				symbol_in_winbar = {
					separator = "  ",
				},
			})
		end,
	},

	{
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},

	"kylechui/nvim-surround",

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	"ziglang/zig.vim",

	"anuvyklack/hydra.nvim",
	"echasnovski/mini.nvim",
	"numToStr/Comment.nvim",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"savq/melange",
	"Mofiqul/vscode.nvim",
	"sindrets/diffview.nvim",
	"arkav/lualine-lsp-progress",
	"nvim-telescope/telescope-ui-select.nvim",
	"simrat39/rust-tools.nvim",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-autopairs",
	"sindrets/winshift.nvim",
	"peitalin/vim-jsx-typescript",
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	"nvim-treesitter/playground",
	"emi2k01/material.nvim",
	"b0o/schemastore.nvim",
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					insert_only = false,
				},
			})
		end,
	},
	{
		"nanozuki/tabby.nvim",
	},
	"sam4llis/nvim-tundra",
	"mattn/emmet-vim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	"tamago324/nlsp-settings.nvim",
	"sigmaSd/deno-nvim",
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				on_colors = function(colors)
					colors.bg = "#08090d"
					colors.bg_dark = "#06070a"
					colors.bg_float = colors.bg_dark
					colors.bg_popup = colors.bg_dark
					colors.bg_sidebar = colors.bg_dark
					colors.bg_highlight = "#0e1017"
				end,
			})
		end,
	},
})
