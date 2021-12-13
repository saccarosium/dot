require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require'cmp'.setup{
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
}

vim.lsp.set_log_level("debug")

require'lspconfig'.clangd.setup{
    on_attach = on_attach,
}

require'lspconfig'.bashls.setup{
    on_attach = on_attach,
}
