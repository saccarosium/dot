local cmp = require'cmp'

cmp.setup {
  sources = {
    { name = 'nvim_lsp', max_item_count = 5},
    { name = 'buffer', keyword_length = 5},
  }
}
