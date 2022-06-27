" set: {{{

set cursorline
set expandtab
set grepprg=rg\ --vimgrep\ --no-heading
set guicursor=
set laststatus=0
set list lcs=trail:-,tab:>\ ,space:·,eol:¬
set noswapfile
set nowrap
set nu relativenumber
set smartindent
set foldmethod=marker
set shiftwidth=4
set softtabstop=4
set tabstop=4
set splitbelow
set termguicolors
set textwidth=80

" }}}
" wildmenu: {{{

set path+=**
set wildignorecase
set wildignore+=*.o
set wildignore+=*.a
set wildignore+=.git/

" }}}
" vars: {{{

let mapleader=' '
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1

" }}}
" plugins: {{{

call plug#begin('$XDG_DATA_HOME/bundle')
    Plug 'tomasiser/vim-code-dark'
    Plug 'justinmk/vim-dirvish'
    Plug 'nvim-orgmode/orgmode'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'numToStr/Comment.nvim'
    Plug 'tpope/vim-fugitive'
    nnoremap <leader>gs :vert G<CR>
    nnoremap <leader>gl :vert G log<CR>
    nnoremap <leader>gd :vert G diff %<CR>
    nnoremap <leader>gp :G push origin<CR>
    nnoremap <leader>gP :G push origin --force<CR>
    nnoremap <leader>gc :G checkout
    Plug 'tpope/vim-eunuch'
call plug#end()

lua require("sacca.orgmode")
lua require("sacca.treesitter")
lua require("sacca.comment")

" }}}
" colors: {{{

colorscheme codedark

" }}}
" abbrevs: {{{

cnoreabbrev vb vs<space><bar><space>b
cnoreabbrev sb sp<space><bar><space>b
cnoreabbrev db bdelete!
cnoreabbrev dot $DOTFILES

" }}}
" maps: {{{

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>
nnoremap ga <C-^>
nnoremap <tab> za
nnoremap S :%s/
vnoremap <C-y> "+y
vmap < <gv
vmap > >gv
nnoremap <C-q> :call sacca#toggleQuickFix()<CR>
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
tnoremap <C-w>c <C-\><C-N><C-w>c

" }}}
" statusline: {{{

set statusline=
set statusline+=%{sacca#printspace()}
set statusline+=%{sacca#gitinfo()}
set statusline+=%{sacca#printspace()}
set statusline+=%F
set statusline+=%m
set statusline+=%=
set statusline+=%l:%c
set statusline+=%{sacca#printspace()}
set statusline+=%{&filetype}
set statusline+=%{sacca#printspace()}

" }}}
" autocmds: {{{

augroup sacca
    autocmd!
    " Remove all trilling whitespaces when saving file
    autocmd BufWritePre * %s/\s\+$//e
    autocmd WinLeave * call sacca#statusline()
    autocmd WinEnter * call sacca#statusline()
    autocmd BufEnter * call sacca#printFile()
    " Take control over the formatoption variable
    autocmd Filetype * call sacca#setFormat()
    " Dedect asciidoc
    autocmd Filetype *.txt set filetype=asciidoc
    " cosmetic changes for built in terminal
    autocmd TermOpen * call sacca#terminal()
augroup END

" }}}
