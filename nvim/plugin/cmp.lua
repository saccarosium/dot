local cmp = require'cmp'

cmp.setup {
  -- mapping = {
  --   ['<C-Space>'] = cmp.mapping.confirm {
  --     behavior = cmp.ConfirmBehavior.Insert,
  --     select = true,
  --   },
  -- },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 10},
    { name = 'luasnip', max_item_count = 10},
    { name = 'nvim_lua' },
    { name = 'buffer', keyword_length = 2},
  }
}
