require "paq" {
    'wbthomason/packer.nvim';
    'justinmk/vim-dirvish';
    'tomasiser/vim-code-dark';
    {'nvim-treesitter/nvim-treesitter', run=vim.fn[':TSUpdate']};
    'tpope/vim-eunuch';
    'tpope/vim-fugitive';
    'neovim/nvim-lspconfig';
    'norcalli/nvim-colorizer.lua';
    'numToStr/Comment.nvim';
    'nvim-orgmode/orgmode';
    'dhruvasagar/vim-table-mode';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-nvim-lsp';
}

require("sacca.cmp")
require("sacca.lsp")
require("sacca.colorizer")
require("sacca.comment")
require("sacca.org")
require("sacca.tree-sitter")
