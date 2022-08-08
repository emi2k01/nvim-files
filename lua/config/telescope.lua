local util = require("util")

util.map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
util.map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
util.map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
