local g = vim.g
local cmd = vim.cmd

-- require("sacca")

require "paq" {
    "arcticicestudio/nord-vim";
    "savq/paq-nvim";
    "neovim/nvim-lspconfig"; 
    { "nvim-treesitter/nvim-treesitter", vim.fn["TSUpdate"] };
    "nvim-treesitter/nvim-treesitter-refactor";
    "tpope/vim-fugitive";
    "tpope/vim-eunuch";
    "nvim-lua/plenary.nvim";
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "saadparwaiz1/cmp_luasnip";
    "norcalli/nvim-colorizer.lua";
    "numToStr/Comment.nvim";
    "akinsho/toggleterm.nvim";
    "L3MON4D3/LuaSnip";
    "saccarosium/ayu-vim";
    { 'ibhagwan/fzf-lua', branch = 'main'}
}

g.nord_bold_vertical_split_line = 1
g.nord_bold = 1
g.nord_italic = 1
g.ayucolor = "mirage"
cmd('colorscheme ayu')

-- Mapping leader
g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
cmd('let &runtimepath.="," . expand("$HOME") . "/Repos/ayu/ayu-vim"')
  
-- Window manager
map('n', 'q', '<C-w>c', opts)
map('n', 'Q', 'q', opts)
map('n', 'Q', 'q', opts)
-- Quick open
map('n', '<leader>os', ':vsplit $SYNC/scratchpad.md<CR>', opts)
map('n', '<leader>or', ':vsplit ./README.md<CR>', opts)
map('n', '<leader>oc', ':e $DOTFILES/nvim/init.lua<CR>', opts)
-- Search
map('n', '<leader>fP', ':lua require("fzf-lua").files({ cwd = "~/.local/share/nvim/site/pack" })<CR>', opts)
map('n', '<leader>fn', ':lua require("fzf-lua").files({ cwd = vim.env.NOTES })<CR>', opts)
map('n', '<leader>f.', ':lua require("fzf-lua").files({ cwd = vim.env.DOTFILES })<CR>', opts)
map('n', '<leader>fl', ':FzfLua blines<CR>', opts)
map('n', '<leader>fw', ':FzfLua live_grep<CR>', opts)
map('n', '<leader>fb', ':FzfLua buffers<CR>', opts)
map('n', '<C-f>', ':FzfLua files<CR>', opts)
map('n', '<C-h>', ':FzfLua help_tags<CR>', opts)
map('n', '<M-x>', ':FzfLua commands<CR>', opts)
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
