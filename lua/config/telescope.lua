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
vim.keymap.set("n", "<leader>ff", function()
	require('fzf-lua').files()
end)
vim.keymap.set("n", "<leader>FF", function()
	require('fzf-lua').files({ cwd = vim.fn.expand("%:p:h") })
end)
vim.keymap.set("n", "<leader>fF", function()
	require('fzf-lua').files({ cwd = vim.fn.expand("%:p:h:h") })
end)
vim.keymap.set("n", "<leader>fb", function()
	require('fzf-lua').buffers()
end)
vim.keymap.set("n", "<leader>fg", function()
	require('fzf-lua').grep_project()
end)
vim.keymap.set("n", "<leader>fG", function()
	require('fzf-lua').grep_project({ cwd = vim.fn.expand("%:p") })
end)
vim.keymap.set("n", "<leader>fs", function()
	require('fzf-lua').lsp_document_symbols()
end)
vim.keymap.set("n", "<leader>fd", function()
	require('fzf-lua').lsp_diagnostics_document()
end)
vim.keymap.set("n", "<leader>fD", function()
	require('fzf-lua').lsp_diagnostics_workspace()
end)

telescope.load_extension("zf-native")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
