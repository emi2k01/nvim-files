local util = require("util")
local telescope = require("telescope")

util.map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
util.map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
util.map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")

vim.keymap.set("n", "<leader>fF",
    function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) end)
vim.keymap.set("n", "<leader>FF",
    function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h:h') }) end)

local find_tree_marks = function(opts)
    local tree_api = require("nvim-tree.api")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local make_entry = require("telescope.make_entry")
    local previewers = require("telescope.previewers")

    opts = opts or {}
    opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()

    local paths = {}
    local marks_list = tree_api.marks.list()
    for k, v in pairs(marks_list) do
        print(v)
        table.insert(paths, v.absolute_path)
    end
    print(tree_api.marks.list()[0])
    pickers.new(opts, {
        prompt_title = "Tree marks",
        finder = finders.new_table {
            results = paths,
            entry_maker = make_entry.gen_from_file(opts),
        },
        previewer = conf.file_previewer(opts),
        sorter = conf.file_sorter(opts)
    }):find()
end

vim.keymap.set("n", "<leader>ft", find_tree_marks)

telescope.load_extension("zf-native")
