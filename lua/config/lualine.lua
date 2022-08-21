require("lualine").setup({
    options = {
        theme = "nord" -- doesn't work :(
    },
    sections = {
        lualine_c = {
            "filename",
            "lsp_progress"
        }
    }
})
