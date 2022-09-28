require("mason").setup()
require("mason-lspconfig").setup()
local aerial = require("aerial")
local cmp_lsp = require("cmp_nvim_lsp")
local pickers = require("telescope.builtin")

local M = {}

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", ",e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", ",q", vim.diagnostic.setloclist, opts)

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", pickers.lsp_definitions, bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "gi", pickers.lsp_implementations, bufopts)
	vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", bufopts)
	vim.keymap.set("n", "<space>D", pickers.lsp_type_definitions, bufopts)
	vim.keymap.set("n", ",rn", "<cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", ",ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", pickers.lsp_references, bufopts)
	vim.keymap.set("n", ",f", function()
		vim.lsp.buf.formatting()
	end, bufopts)
	vim.keymap.set("n", ",ha", require("rust-tools").hover_actions.hover_actions, bufopts)
end

local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("rust-tools").setup({
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			aerial.on_attach(client, bufnr)
		end,
		settings = {
			["rust-analyzer"] = {
				rustfmt = {
					extraArgs = { "+nightly" },
				},
				checkOnSave = {
					enable = true,
				},
				diagnostics = {
					experimental = {
						enable = false,
					},
				},
				files = {
					watcher = "server",
				},
			},
		},
	},
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
	settings = {
		typescript = {
			tsserver = {
				watchOptions = {
					watchFile = "useFsEventsOnParentDirectory",
				},
			},
		},
	},
})

lspconfig.graphql.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
})

lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
})

lspconfig.zls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
})

lspconfig.svelte.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.resolved_capabilities.document_formatting = false
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
})

lspconfig.marksman.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		aerial.on_attach(client, bufnr)
	end,
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

M.on_attach = on_attach

return M
