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
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
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

luasnip.config.setup({
    region_check_events = "CursorMoved",
})

util.map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "./lua/config/snippets" })
