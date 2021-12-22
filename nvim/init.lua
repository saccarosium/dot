local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

require "paq" {
	"savq/paq-nvim";                  -- Let Paq manage itself
	"neovim/nvim-lspconfig";          -- Mind the semi-colons
	"nvim-treesitter/nvim-treesitter";
	"nvim-lua/plenary.nvim";
	"nvim-telescope/telescope.nvim";
	"neovim/nvim-lspconfig";
	"hrsh7th/cmp-nvim-lsp";
	"hrsh7th/cmp-buffer";
	"hrsh7th/cmp-path";
	"hrsh7th/nvim-cmp";
	"vim-pandoc/vim-pandoc-syntax";
	{"dracula/vim", as="dracula"}
}

g.mapleader = " "
cmd('colorscheme dracula')
cmd('hi! Normal ctermbg=NONE guibg=NONE')
opt.laststatus = 0
opt.relativenumber = true
opt.showcmd = false
opt.clipboard = 'unnamedplus'
opt.backup = false

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>fo', ':Telescope file_browser<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fF', ':Telescope grep_string<CR>')
map('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

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

