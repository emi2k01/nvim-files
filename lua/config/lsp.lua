require("mason").setup()
require("mason-lspconfig").setup()
local aerial = require("aerial")
local cmp_lsp = require("cmp_nvim_lsp")
local pickers = require("telescope.builtin")

local M = {}

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "tsserver" }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

---@diagnostic disable-next-line: unused-local
local on_attach = function(_client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', pickers.lsp_definitions, bufopts)
    vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>", bufopts)
    vim.keymap.set('n', 'gi', pickers.lsp_implementations, bufopts)
    vim.keymap.set('n', '<C-k>', "<cmd>Lspsaga signature_help<CR>", bufopts)
    vim.keymap.set('n', '<space>D', pickers.lsp_type_definitions, bufopts)
    vim.keymap.set('n', ',rn', "<cmd>Lspsaga rename<CR>", bufopts)
    vim.keymap.set('n', ',ca', require("lspsaga.codeaction").code_action, bufopts)
    vim.keymap.set('n', 'gr', pickers.lsp_references, bufopts)
    vim.keymap.set('n', ',f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })

local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        aerial.on_attach(client, bufnr)
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        aerial.on_attach(client, bufnr)
    end
}

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
        aerial.on_attach(client, bufnr)
    end
}

lspconfig.graphql.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
        aerial.on_attach(client, bufnr)
    end
}

M.on_attach = on_attach

return M
