" ------------------------------------ let -----------------------------------

set path+=**
set laststatus=0 " noshowmode
set number relativenumber
set mouse=a guicursor=
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent
set nobackup noswapfile
set textwidth=80
set termguicolors
" set conceallevel=0
set nowrap
" set cursorline
set splitbelow splitright
set wildignorecase
set signcolumn=yes
set foldlevelstart=99 foldmethod=marker
set spelllang=en_us

" ----------------------------------- vars -----------------------------------

let mapleader=' '
let g:gruvbox_sign_column='none'
let g:gruvbox_contrast_dark='hard'
let g:markdown_folding=1
" let g:markdown_fenced_languages = { 'bash', 'c', 'cpp', 'python', 'ruby', 'vim', 'sh' }

" ---------------------------------- autocmd ---------------------------------

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
    Plug 'savq/paq-nvim'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    " Syntax
    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sheerun/vim-polyglot'
    Plug 'norcalli/nvim-colorizer.lua'
    " Utility
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-eunuch'
    Plug 'ibhagwan/fzf-lua'
    Plug 'tpope/vim-commentary'
    Plug 'sbdchd/neoformat'
    " Writing
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'junegunn/goyo.vim'
call plug#end()

" ---------------------------------- colors ----------------------------------

colorscheme gruvbox

" ----------------------------------- remap ----------------------------------

nnoremap <leader>or :vsplit ./README.md<CR>
nnoremap <leader>oc :e $DOTFILES/nvim/init.*<CR>
nnoremap <leader>ob :e $DOTFILES/bash/.bashrc<CR>
nnoremap <C-f> :FzfLua files<CR>
nnoremap <C-s> :FzfLua buffers<CR>
nnoremap <C-h> :FzfLua help_tags<CR>
nnoremap <M-x> :FzfLua commands<CR>
nnoremap <leader>fl :FzfLua blines<CR>
nnoremap <leader>fh :FzfLua command_history<CR>
nnoremap <leader>fw :lua require("fzf-lua").live_grep({ exec_empty_query = true }) <CR>
nnoremap <leader>fr :FzfLua resume<CR>
nnoremap <leader>fb :FzfLua buffers<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :G log<CR>
nnoremap <leader>gp :G push origin<CR>
nnoremap <leader>gP :G push --force origin<CR>
nnoremap <leader>gd :G diff<CR>
nnoremap <leader>gc :G checkout
nnoremap <leader>gb :echomsg FugitiveStatusline()<CR>
nnoremap <leader>lf :Neoformat<CR>
vnoremap <C-y> "+y
