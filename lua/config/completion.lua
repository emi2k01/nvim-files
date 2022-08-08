local cmp = require("cmp")
local luasnip = require("luasnip")
local util = require("util")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm()
            else
                fallback()
            end
        end)
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    })
})

util.map("i", "<Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", { expr = true })
util.map("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "./lua/config/snippets" })
