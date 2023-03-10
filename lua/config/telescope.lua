local util = require("util")
local telescope = require("telescope")
local action_state = require("telescope.actions.state")
local fb_utils = require("telescope._extensions.file_browser.utils")

local tcd_action = function(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local finder = current_picker.finder
	local entry_path = action_state.get_selected_entry().Path
	finder.path = entry_path:is_dir() and entry_path:absolute() or entry_path:parent():absolute()
	finder.cwd = finder.path
	vim.cmd("tcd " .. finder.path)

	fb_utils.redraw_border_title(current_picker)
	current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
end

telescope.setup({
	extensions = {
		fzf = {},
		file_browser = {
			mappings = {
					["i"] = {
						["<C-t>"] = tcd_action,
				},
					["n"] = {
						["t"] = tcd_action,
				},
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "<space>wt", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>wT", "<cmd>Telescope file_browser path=%:p:h<CR>", { noremap = true })
util.map(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files{ path_display = { smart = true, truncate = 50 } } <CR>"
)
vim.keymap.set("n", "<leader>FF", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
end)
vim.keymap.set("n", "<leader>fF", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h:h") })
end)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
util.map(
	"n",
	"<leader>fg",
	"<cmd>lua require'telescope.builtin'.live_grep{ path_display = { smart = true, truncate = 50 } } <CR>"
)
util.map(
	"n",
	"<leader>fG",
	"<cmd>lua require'telescope.builtin'.live_grep{ search_dirs={'%:p'}, path_display = 'hidden' } <CR>"
)
util.map("n", "<leader>fa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
util.map("n", "<leader>fB", "<cmd>Telescope buffers<CR>")
util.map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>")
util.map("n", "<leader>fD", "<cmd>Telescope diagnostics<CR>")
util.map("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>")

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
	pickers
		.new(opts, {
			prompt_title = "Tree marks",
			finder = finders.new_table({
				results = paths,
				entry_maker = make_entry.gen_from_file(opts),
			}),
			previewer = conf.file_previewer(opts),
			sorter = conf.file_sorter(opts),
		})
		:find()
end

vim.keymap.set("n", "<leader>ft", find_tree_marks)

telescope.load_extension("zf-native")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
