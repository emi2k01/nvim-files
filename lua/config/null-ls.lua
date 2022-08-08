local lsp = require("config/lsp")

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.diagnostics.eslint_d,
    },
    on_attach = lsp.on_attach
})
