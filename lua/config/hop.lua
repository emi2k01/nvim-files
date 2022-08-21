require("hop").setup()

vim.keymap.set("", 'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
vim.keymap.set("", 'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR})<cr>", {})
vim.keymap.set("", 't',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_offset = -1 })<cr>"
    , {})
vim.keymap.set("", 'T',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, hint_offset = 1 })<cr>"
    , {})
vim.keymap.set("", "<leader>fw", require("hop").hint_words, {})
