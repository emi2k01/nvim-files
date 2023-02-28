local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = "menuone,noinsert,noselect",
		keyword_length = 1,
		autocomplete = {
			cmp.TriggerEvent.InsertEnter,
			cmp.TriggerEvent.TextChanged,
		},
	},
	window = {
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
			elseif luasnip.expandable() then
				luasnip.expand()
			else
				fallback()
			end
		end),
	}),
	experimental = { ghost_text = true },
	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lsp_signature_help" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxWidth = 50,
			symbol_map = { Copilot = "" },
		}),
	},
	sorting = {
		comparators = {
			cmp.config.compare.recently_used,
			cmp.config.compare.offset,
			cmp.config.compare.score,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

luasnip.config.setup({
	region_check_events = "InsertLeave,CursorMoved",
	delete_check_events = "TextChanged,InsertLeave",
})

vim.keymap.set({ "s", "i" }, "<C-j>", "<cmd>lua require('luasnip').jump(1)<CR>", {})
vim.keymap.set({ "s", "i" }, "<C-k>", "<cmd>lua require('luasnip').jump(-1)<CR>", {})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "./lua/config/snippets" })
