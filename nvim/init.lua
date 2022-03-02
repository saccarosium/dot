require "paq" {
  -- Plug 'arcticicestudio/nord-vim';
  { "saccarosium/nord-vim",  branch="contrib" };
  "neovim/nvim-lspconfig";
  { "nvim-treesitter/nvim-treesitter", vim.fn["TSUpdate"] };
  "nvim-treesitter/nvim-treesitter-refactor";
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-nvim-lsp";
  "nvim-lua/plenary.nvim";
  "nvim-telescope/telescope.nvim";
  { "nvim-telescope/telescope-fzf-native.nvim",  run="make" };
  "tpope/vim-fugitive";
  "norcalli/nvim-colorizer.lua";
  "kblin/vim-fountain";
  "numToStr/Comment.nvim";
}
 
vim.g.nord_bold_vertical_split_line = 1
vim.g.nord_bold = 1
vim.cmd('colorscheme nord')

vim.g.mapleader = ' '
vim.g.maplocalleader = "<leader>l" 
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
-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>f.', ':lua require("telescope.builtin").find_files({ prompt_title = "< DotFiles >", cwd = vim.env.DOTFILES, })<CR>')
map('n', '<leader>fn', ':lua require("telescope.builtin").find_files({ prompt_title = "< Notes >", cwd = vim.env.NOTES, })<CR>')
map('n', '<leader>fw', ':Telescope live_grep<CR>')
map('n', '<C-h>', ':Telescope help_tags<CR>')
-- Git
map('n', '<leader>gs', ':vert G<CR>')
map('n', '<leader>gl', ':Commits<CR>')
map('n', '<leader>gd', ':vert G diff<CR>')
map('n', '<leader>gp', ':G push')
map('n', '<leader>gc', ':G checkout')
map('n', '<leader>gj', ':diffget //3<CR>')
map('n', '<leader>gf', ':diffget //2<CR>')
map('n', '<leader>gb', ':!git branch<CR>')

-- Setting
vim.g.markdown_folding = 1
vim.g.markdown_fenced_languages = {'c', 'python', 'ruby', 'vim'}
