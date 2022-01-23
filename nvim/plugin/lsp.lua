local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

vim.diagnostic.config({virtual_text = false})

require('lspconfig').clangd.setup({})


