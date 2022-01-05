local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

require "paq" {
	"savq/paq-nvim";           
	"neovim/nvim-lspconfig";    
	"nvim-treesitter/nvim-treesitter";
	"neovim/nvim-lspconfig";
	"hrsh7th/cmp-nvim-lsp";
	"hrsh7th/cmp-buffer";
	"hrsh7th/cmp-path";
	"hrsh7th/nvim-cmp";
	"vim-pandoc/vim-pandoc-syntax";
	"numToStr/Comment.nvim";
    "ishan9299/modus-theme-vim";
	{"dracula/vim", as="dracula"};
}

g.mapleader = " "
cmd('colorscheme dracula')
cmd('hi! Normal ctermbg=NONE guibg=NONE') opt.laststatus = 0
opt.relativenumber = true
opt.showcmd = false
opt.clipboard = 'unnamedplus'
opt.backup = false

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>oc', ':e $XDG_CONFIG_HOME/nvim/init.lua<CR>')
map('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

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

require('Comment').setup()
