local g = vim.g
local cmd = vim.cmd

require "paq" {
    "savq/paq-nvim";
    "neovim/nvim-lspconfig"; 
    { "nvim-treesitter/nvim-treesitter", vim.fn["TSUpdate"] };
    "nvim-treesitter/nvim-treesitter-refactor";
    "tpope/vim-fugitive";
    "tpope/vim-eunuch";
    "dhruvasagar/vim-table-mode";
    "ibhagwan/fzf-lua";
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "norcalli/nvim-colorizer.lua";
    "numToStr/Comment.nvim";
}

cmd('colorscheme ayu')

-- Mapping leader
g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
      
-- Quick open
map('n', '<leader>or', ':vsplit ./README.md<CR>', opts)
map('n', '<leader>oc', ':e $DOTFILES/nvim/init.lua<CR>', opts)
map('n', '<leader>ob', ':e $DOTFILES/bash/.bashrc<CR>', opts)
-- Search
map('n', '<C-f>', ':FzfLua files<CR>', opts)
map('n', '<C-h>', ':FzfLua help_tags<CR>', opts)
map('n', '<M-x>', ':FzfLua commands<CR>', opts)
map('n', '<leader>fl', ':FzfLua blines<CR>', opts)
map('n', '<leader>fh', ':FzfLua command_history<CR>', opts)
map('n', '<leader>fw', ':lua require("fzf-lua").live_grep({ exec_empty_query = true }) <CR>', opts)
map('n', '<leader>fr', ':FzfLua resume<CR>', opts)
-- Git
map('n', '<leader>gs', ':G<CR>', opts)
map('n', '<leader>gl', ':G log<CR>', opts)
map('n', '<leader>gp', ':G push origin<CR>', opts)
map('n', '<leader>gP', ':G push --force origin<CR>', opts)
map('n', '<leader>gd', ':G diff<CR>', opts)
map('n', '<leader>gc', ':G checkout', opts)
map('n', '<leader>gb', ':echomsg FugitiveStatusline()<CR>', opts)

g.markdown_folding = 1
g.markdown_fenced_languages = {'bash', 'c', 'cpp', 'python', 'ruby', 'vim'}
