local neogit = require("neogit")

vim.keymap.set("n", "<leader>gg", neogit.open)
vim.keymap.set("n", "<leader>gc", function () neogit.open({ "commit" }) end)
vim.keymap.set("n", "<leader>gP", function () neogit.open({ "push" }) end)
vim.keymap.set("n", "<leader>gp", function () neogit.open({ "pull" }) end)
