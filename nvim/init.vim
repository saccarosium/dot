" ------------------------------------ set -----------------------------------

set path+=**
set exrc
set laststatus=0
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
set nofoldenable foldmethod=marker
set wildignorecase
set termguicolors

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let maplocalleader = ' '
let g:markdown_folding=1

" --------------------------------- plugings ---------------------------------

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('$XDG_DATA_HOME/plugs')
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'lervag/wiki.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'numToStr/Comment.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tomasiser/vim-code-dark'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'sbdchd/neoformat'
    Plug 'preservim/nerdtree'
call plug#end()

lua require("sacca.cmp")
lua require("sacca.colorizer")
lua require("sacca.comment")
lua require("sacca.lsp")
lua require("sacca.tree-sitter")

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme codedark

" ------------------------------ commands/abbrev -----------------------------

:command PlugSync PlugClean | PlugInstall
cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev dot $DOTFILES

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $MYVIMRC<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>os :e $SYNC/scratchpad.md<CR>
nnoremap <leader>o. :e $DOTFILES<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
vnoremap <C-y> "+y
nnoremap <C-n> :bn!<CR>
nnoremap <C-p> :bp!<CR>
