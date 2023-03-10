require("mini.ai").setup({})
require("mini.bufremove").setup({})
require("mini.indentscope").setup({})
require("mini.cursorword").setup({
    delay = 0,
})

vim.keymap.set("n", "<leader>wD", require("mini.bufremove").unshow)

