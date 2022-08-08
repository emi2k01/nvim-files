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
end)
