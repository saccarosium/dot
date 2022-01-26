require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

vim.diagnostic.config({virtual_text = false})

require('lspconfig').clangd.setup({})
require('lspconfig').vimls.setup({})


