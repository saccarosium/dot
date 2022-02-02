set path+=**
set laststatus=0
set number relativenumber
set mouse=a
set guicursor=
set ignorecase smartcase
set tabstop=2 softtabstop=2 expandtab
set shiftwidth=2
set noshowmode
set noswapfile nobackup
set textwidth=70
set termguicolors
set conceallevel=3
set foldlevelstart=99 foldmethod=manual
filetype plugin indent on

call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  " Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'ledger/vim-ledger'
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'TimUntersberger/neogit'

call plug#end()

syntax on
colorscheme dracula
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

let g:markdown_folding = 1
let mapleader=" "

cnoreabbrev W! w!
cnoreabbrev W w

nnoremap <leader>oc :e $DOTFILES/nvim/init.vim<CR>
nnoremap <leader>ot :e $SYNC/Projects/TODO.md<CR>
nnoremap <leader>ob :e $HOME/Documents/finaces/2021-2022.ledger<CR>

nnoremap <leader><space> :Files<CR>
nnoremap <leader>fn :Files $NOTES<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <C-h> :Helptags<CR>
nnoremap <C-b> :call fzf#run({'source': 'cdscuts_glob_echo', 'sink': 'cd'})<CR>

nnoremap <C-j> :Explore<CR>
nnoremap <C-w>t :tabnew<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

" nnoremap gd :lua vim.lsp.buf.declaration()<CR>
" nnoremap gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap gD :lua vim.lsp.buf.definition()<CR>
" nnoremap gr :lua vim.lsp.buf.references()<CR>
" nnoremap gh :lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <C-c>r :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>e :lua vim.diagnostic.open_float()<CR>
" nnoremap <leader>q :lua vim.diagnostic.setloclist()<CR> 
" nnoremap <C-c>f :lua vim.lsp.buf.formatting()<CR>

" nnoremap <leader>gs :vert G<CR>
" nnoremap <leader>gd :vert G diff<CR>
" nnoremap <leader>gp :vert G push<CR>
" nnoremap <leader>gl :vert G log<CR>

nnoremap <leader>gs :Neogit kind=vsplit<CR>

nnoremap q <C-w>c
nnoremap Q q

let g:fzf_layout = {'down': '30%'} 
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search
let g:ledger_maxwidth = 70
let g:markdown_fenced_languages = ['c', 'python', 'ruby', 'vim']

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> nd d
  nmap <buffer> nf %:w<CR>:buffer #<CR>
  nmap <buffer> . gh
  nmap <buffer> M mfj
  nmap <buffer> U mu
  nmap <buffer> p mtmc
  nmap <buffer> v mtmm
  nmap <buffer> <C-g> :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
  nmap <buffer> <C-j> :Rexplore<CR>
endfunction
 
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

