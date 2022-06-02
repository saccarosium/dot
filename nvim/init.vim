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
set nofoldenable foldmethod=marker
set wildignorecase
set termguicolors
set grepprg=rg\ --vimgrep\ --no-heading

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
    Plug 'echasnovski/mini.nvim'
    Plug 'justinmk/vim-dirvish'
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-orgmode/orgmode'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'saccarosium/vim-code-dark'
    Plug 'saccarosium/vim-minisnip'
    Plug 'sbdchd/neoformat'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    " Plug '~/Repos/vim-dotoo'
call plug#end()

lua require("sacca.colorizer")
" lua require("sacca.comment")
lua require("sacca.lsp")
lua require("sacca.tree-sitter")
lua require("sacca.mini")
lua require("sacca.org")

" ---------------------------------- colors ----------------------------------

filetype plugin on
syntax on
colorscheme codedark

" ------------------------------ commands/abbrev -----------------------------

:command PlugSync PlugClean | PlugInstall | PlugUpdate | PlugUpgrade
cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev db bdelete!
cnoreabbrev dot $DOTFILES

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $MYVIMRC<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>ot :e $SYNC/Projects/org/todo.org<CR>
nnoremap <leader>op :e $SYNC/Projects/org<CR>
nnoremap <leader>os :e $SYNC/scratchpad.md<CR>
nnoremap <leader>o. :e $DOTFILES/nvim<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
vnoremap <C-y> "+y
vmap < <gv
vmap > >gv
cnoremap <C-h> <BS>
cnoremap <C-a> <Home>
cnoremap <A-b> <Left>
cnoremap <A-f> <Right>
