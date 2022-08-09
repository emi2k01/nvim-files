local cmp = require("cmp")
local luasnip = require("luasnip")
local util = require("util")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end)
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxWidth = 50,
        })
    }
})

util.map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "./lua/config/snippets" })
