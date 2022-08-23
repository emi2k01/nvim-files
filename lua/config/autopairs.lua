require("nvim-autopairs").setup({})
require("nvim-autopairs").get_rule("{"):replace_map_cr(function()
    return "<C-g>u<CR><C-c>Ox<BS>"
end)
require("nvim-autopairs").get_rule("["):replace_map_cr(function()
    return "<C-g>u<CR><C-c>Ox<BS>"
end)
require("nvim-autopairs").get_rule("("):replace_map_cr(function()
    return "<C-g>u<CR><C-c>Ox<BS>"
end)
vim.keymap.set("i", "<CR>", "<CR>x<BS>", { silent = true })
