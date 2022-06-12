" ------------------------------------ set -----------------------------------

set path+=**
set exrc
set laststatus=2
set number relativenumber
set mouse=a guicursor=
set list listchars=trail:-,tab:>>,space:·,eol:¬
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab smartindent
set nobackup noswapfile nowritebackup
set textwidth=80 nowrap
set cursorline
set splitbelow splitright
set signcolumn=yes
set nofoldenable
set foldmethod=marker
set wildignorecase
set termguicolors
set grepprg=rg\ --vimgrep\ --no-heading

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let maplocalleader = ' '

" --------------------------------- plugings ---------------------------------

call plug#begin('$XDG_DATA_HOME/nvim/bundle')
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'justinmk/vim-dirvish'
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-orgmode/orgmode'
    Plug 'Mofiqul/vscode.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tomasiser/vim-code-dark'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
call plug#end()

if sacca#isLoaded('cmp')
    lua require("sacca.cmp")
endif
if sacca#isLoaded('lspconfig')
    lua require("sacca.lsp")
endif
if sacca#isLoaded('colorizer')
    lua require("sacca.colorizer")
endif
if sacca#isLoaded('orgmode')
    lua require("sacca.org")
endif
if sacca#isLoaded('nvim-treesitter')
    lua require("sacca.tree-sitter")
endif

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme codedark

" ------------------------------ commands/abbrev -----------------------------

:command PlugSync PlugClean | PlugInstall | PlugUpdate | PlugUpgrade
cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev db bdelete!
cnoreabbrev _s %s/
cnoreabbrev dot $DOTFILES

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $MYVIMRC<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>ot :e $SYNC/Projects/org/todo.org<CR>
nnoremap <leader>op :e $SYNC/Projects/org<CR>
nnoremap <leader>os :e $SYNC/scratchpad.md<CR>
nnoremap <leader>o. :e $DOTFILES/nvim<CR>
nnoremap <leader>on :e $SYNC/notes<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <leader>lf :norm m0gggqG'0<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
vnoremap <C-y> "+y
vmap < <gv
vmap > >gv
