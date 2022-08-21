require("mini.ai").setup({})
require("mini.bufremove").setup({})
require("mini.indentscope").setup({})

vim.keymap.set("n", "<leader>wD", require("mini.bufremove").unshow)

