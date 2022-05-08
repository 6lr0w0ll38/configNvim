local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

--use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

--use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

--luasnip
require'luasnip.loaders.from_vscode'.lazy_load()

--autopairs
require'nvim-autopairs'.setup()

--indentblankline
require'indent_blankline'.setup {
    space_char_blackline = " ",
    --for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
