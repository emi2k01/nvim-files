return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "mhinz/vim-startify"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "shaunsingh/nord.nvim"
    use "https://gitlab.com/yorickpeterse/nvim-window.git"
    use "jose-elias-alvarez/null-ls.nvim"
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup({})
        end
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end
    }
    use {
        "stevearc/aerial.nvim",
        requires = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("aerial").setup({})
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "rust", "typescript", "javascript", "tsx" },
                highlight = {
                    enable = true
                }
            }
        end
    }
    use {
        "kyazdani42/nvim-tree.lua",
        tag = "nightly",
        config = function()
            require("nvim-tree").setup()
        end
    }
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").init_lsp_saga({})
        end
    }

    use {
        "TimUntersberger/neogit",
        config = function()
            require("neogit").setup({})
        end
    }
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    }

    use "tpope/vim-surround"

    use {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    }
end)
