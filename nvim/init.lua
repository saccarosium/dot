local g = vim.g
local cmd = vim.cmd

require("sacca")

require "paq" {
    "arcticicestudio/nord-vim";
    "savq/paq-nvim";
    "neovim/nvim-lspconfig"; 
    { "nvim-treesitter/nvim-treesitter", vim.fn["TSUpdate"] };
    "nvim-treesitter/nvim-treesitter-refactor";
    "tpope/vim-fugitive";
    "tpope/vim-eunuch";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" };
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "saadparwaiz1/cmp_luasnip";
    "norcalli/nvim-colorizer.lua";
    "numToStr/Comment.nvim";
    "akinsho/toggleterm.nvim";
    "L3MON4D3/LuaSnip";
    "Luxed/ayu-vim";
}

g.nord_bold_vertical_split_line = 1
g.nord_bold = 1
g.nord_italic = 1
g.ayucolor = "mirage"
cmd('colorscheme nord')

-- Mapping leader
g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
  
-- Window manager
map('n', 'q', '<C-w>c', opts)
map('n', 'Q', 'q', opts)
map('n', 'Q', 'q', opts)
-- Quick open
map('n', '<leader>os', ':vsplit $SYNC/scratchpad.md<CR>', opts)
map('n', '<leader>or', ':vsplit ./README.md<CR>', opts)
map('n', '<leader>oc', ':e $DOTFILES/nvim/init.lua<CR>', opts)
-- Search
map('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<leader>f.', ':lua require("sacca.telescope.funcs").search_dotfiles()<CR>', opts)
map('n', '<leader>fP', ':lua require("sacca.telescope.funcs").search_plugins()<CR>', opts)
map('n', '<leader>fp', ':lua require("sacca.telescope.funcs").search_projects()<CR>', opts)
map('n', '<leader>fn', ':lua require("sacca.telescope.funcs").search_notes()<CR>', opts)
map('n', '<leader>fw', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<C-f>', ':Telescope find_files<CR>', opts)
map('n', '<C-h>', ':Telescope help_tags<CR>', opts)
map('n', '<M-x>', ':Telescope commands<CR>', opts)
-- Git
map('n', '<leader>gs', ':vert G<CR>', opts)
map('n', '<leader>gl', ':G log<CR>', opts)
map('n', '<leader>gp', ':G push origin<CR>', opts)
map('n', '<leader>gP', ':G push --force origin<CR>', opts)
map('n', '<leader>gd', ':G diff<CR>', opts)
map('n', '<leader>gc', ':G checkout', opts)
map('n', '<leader>gb', ':echomsg FugitiveStatusline()<CR>', opts)

map('n', '<F5>', ':set spell!<CR>', opts)

g.markdown_folding = 1
g.markdown_fenced_languages = {'c', 'cpp', 'python', 'ruby', 'vim'}
