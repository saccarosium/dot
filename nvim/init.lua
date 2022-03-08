local g = vim.g
local cmd = vim.cmd

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_special_files = {}
cmd [[
  let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
  let g:nvim_tree_icons = {
    \ 'git': {
    \   'unstaged': "M",
    \   'staged': "",
    \   'unmerged': "",
    \   'renamed': "R",
    \   'untracked': "U",
    \   'deleted': "D",
    \   'ignored': ""
    \   },
    \ }
]]

require "paq" {
  -- Plug 'arcticicestudio/nord-vim';
  "savq/paq-nvim";
  { "saccarosium/nord-vim",  branch = "contrib" };
  "neovim/nvim-lspconfig"; 
  { "nvim-treesitter/nvim-treesitter", vim.fn["TSUpdate"] };
  "nvim-treesitter/nvim-treesitter-refactor";
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-nvim-lsp";
  "tpope/vim-fugitive";
  "norcalli/nvim-colorizer.lua";
  "kyazdani42/nvim-tree.lua";
  "kblin/vim-fountain";
  "numToStr/Comment.nvim";
  "akinsho/toggleterm.nvim";
  "nvim-lua/plenary.nvim";
  "lewis6991/gitsigns.nvim";
  "junegunn/fzf";
  "junegunn/fzf.vim";
}
 
-- For dark theme
g.nord_bold_vertical_split_line = 1
g.nord_bold = 1
cmd('colorscheme nord')

g.mapleader = ' '
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Window manager
map('n', 'q', '<C-w>c')
map('n', 'Q', 'q')
map('n', '<left>', '<C-w><')
map('n', '<right>', '<C-w>>')
-- Quick open
map('n', '<leader>oc', ':e $DOTFILES/nvim/init.*<CR>')
map('n', '<leader>os', ':vsplit $SYNC/scratchpad.md<CR>')
map('n', '<leader>ot', ':vsplit ./TODO.md<CR>')
-- Quickjumping
map('n', ',,q', ':cprevious<CR>')
map('n', ',q', ':cnext<CR>')
map('n', ',,l', ':lprevious<CR>')
map('n', ',l', ':lnext<CR>')
map('n', ',,b', ':bprevious<CR>')
map('n', ',b', ':bnext<CR>')
-- Search
map('n', '<C-p>', ':Files<CR>')
map('n', '<C-x>b', ':Buffers<CR>')
map('n', '<leader>fl', ':BLines<CR>')
map('n', '<leader>f.', ':Files $DOTFILES<CR>')
map('n', '<leader>fn', ':Files $NOTES<CR>')
map('n', '<leader>fw', ':Rg<CR>')
map('n', '<C-h>', ':Helptags<CR>')
map('n', '<M-x>', ':Commands<CR>')
-- Git
map('n', '<leader>gs', ':vert G<CR>')
map('n', '<leader>gl', ':Commits<CR>')
map('n', '<leader>gp', ':G push')
map('n', '<leader>gd', ':G diff<CR>')
map('n', '<leader>gc', ':G checkout')
map('n', '<leader>gb', ':echomsg FugitiveStatusline()<CR>')

map('n', '<C-f>', ':silent !tmux neww tmux-sessionaizer<CR>')
map('n', '<C-j>', ':NvimTreeToggle<CR>')
map('n', '<F5>', ':set spell!<CR>')

-- Setting
g.markdown_folding = 1
g.markdown_fenced_languages = {'c', 'python', 'ruby', 'vim'}
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1
