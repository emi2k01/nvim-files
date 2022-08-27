local util = require("util")
local telescope = require("telescope")
telescope.setup()

util.map("n", "<leader>fF", "<cmd>lua require'telescope.builtin'.find_files{ path_display = { smart = true, truncate = 50 } } <CR>")
util.map("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep{ path_display = { smart = true, truncate = 50 } } <CR>")
util.map("n", "<leader>fG", "<cmd>lua require'telescope.builtin'.live_grep{ search_dirs={'%:p'}, path_display = 'hidden' } <CR>")
util.map("n", "<leader>fa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
util.map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
util.map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>")

vim.keymap.set("n", "<leader>FF",
    function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) end)
vim.keymap.set("n", "<leader>ff",
    function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h:h') }) end)

local find_tree_marks = function(opts)
    local tree_api = require("nvim-tree.api")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local make_entry = require("telescope.make_entry")

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
telescope.load_extension("ui-select")
