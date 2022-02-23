set path+=**
set laststatus=0
set number relativenumber
set mouse=a guicursor=
set ignorecase smartcase
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set noshowmode
set nobackup
set textwidth=80
set termguicolors
set conceallevel=3
set nowrap
set cursorline
set signcolumn=yes
set foldlevelstart=99 foldmethod=manual
filetype plugin indent on

call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'arcticicestudio/nord-vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'ledger/vim-ledger'
  Plug 'kblin/vim-fountain'
  Plug 'numToStr/Comment.nvim'

call plug#end()

let g:nord_bold_vertical_split_line = 1
let g:nord_bold = 1
colorscheme nord
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
 
let mapleader=' '

cnoreabbrev W! w!
cnoreabbrev W w

nnoremap <leader>oc :e $DOTFILES/nvim/init.vim<CR>
nnoremap <leader>os :e $SYNC/scratchpad.md<CR>

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :GitFiles<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fn :Files $NOTES<CR>
nnoremap <leader>f. :Files $DOTFILES<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <C-h> :Helptags<CR>

nnoremap <leader>j :Explore<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

nnoremap <leader>gs :vert G<CR>
nnoremap <leader>gl :GV<CR>
nnoremap <leader>gb :!git branch<CR>

nnoremap q <C-w>c
nnoremap Q q

let g:ledger_maxwidth = 80
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['c', 'python', 'ruby', 'vim']
