" ------------------------------------ set -----------------------------------

set path+=**
" noshowmode
set laststatus=0
set number relativenumber
set mouse=a guicursor=

set list
set listchars=trail:-,tab:>>,space:·,eol:¬

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent

set nobackup noswapfile
set textwidth=80
set nowrap
set cursorline
" Splits
set splitbelow splitright
set signcolumn=yes
" Folds
set foldlevelstart=99 foldmethod=marker

" Wildmenu
set wildignorecase
set wildignore+=*.o
set wildignore+=*.class
set wildignore+=**/.git/*


" ----------------------------------- vars -----------------------------------

let mapleader=' '
let maplocalleader = ' '
let g:markdown_folding=1

" ---------------------------------- autocmd ---------------------------------
"
" Remove all trilling whitespaces when saving file
autocmd BufWritePre * %s/\s\+$//e

" ----------------------------------- plug -----------------------------------

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('$XDG_DATA_HOME/nvim/plugs')
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'lervag/wiki.vim'
    Plug 'dhruvasagar/vim-table-mode'
call plug#end()

" ---------------------------------- colors ----------------------------------

set termguicolors
filetype plugin on
syntax on
colorscheme dracula

if colors_name == 'dracula'
    hi! Cursorline ctermbg=black guibg=#2f3241
endif

" ------------------------------ commands/abbrev -----------------------------

:command PlugSync PlugUpgrade | PlugClean | PlugInstall | sleep 3 | PlugUpdate | sleep 3 | q!

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $DOTFILES/nvim/init.*<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <leader>o. :e $DOTFILES<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gp :G push origin<CR>
nnoremap <leader>gd :G diff<CR>
nnoremap <leader>gc :G checkout
nnoremap <leader>gb :echomsg FugitiveStatusline()<CR>
nnoremap <leader>th :TSToggle highlight<CR>
nnoremap <leader>vsf :so %<CR>
nnoremap <leader>vsc :so $XDG_CONFIG_HOME/nvim/init.*<CR>
vnoremap <C-y> "+y

" --------------------------------- firenvim ---------------------------------

if exists('g:started_by_firenvim')
    set guifont=JetBrainsMono:h18
    set signcolumn=no
    set nocursorline
endif
