"######################### set settings ##############################

    set packpath^=$XDG_DATA_HOME/nvim/
    set path+=**
    set rtp+=/usr/local/opt/fzf
    set hidden
    set nobackup noswapfile autowriteall
    set conceallevel=2
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
    set wildmenu wildignorecase wildignore+=**/.git/*
    set number relativenumber
    set clipboard+=unnamedplus
    set laststatus=0 noshowcmd guicursor=

"############################# keybings ##############################

    :command W w
    let mapleader=" "
    let maplocalleader=" "
    nnoremap Y y$ 
    nnoremap <C-k> :bn<CR>
    nnoremap <C-j> :bp<CR>
    nnoremap <C-d> :bdelete!<CR>
    nnoremap <leader>c :copen<CR>
    nnoremap <leader>n :cn<CR>
    nnoremap <leader>p :cp<CR>
    nnoremap <leader>fe :FZF $DOTFILES/ <CR>
    nnoremap <leader>fn :FZF $NOTES/ <CR>
    nnoremap <leader>ff :FZF<CR>
    nnoremap <leader>al Vgq
    nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
    vmap < <gv 
    vmap > >gv

    syntax enable
    colorscheme dracula
    set termguicolors t_Co=256
    hi! Normal ctermbg=NONE guibg=NONE 

    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END
    let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim"]
    let g:pandoc#syntax#conceal#urls = 1


    let g:fzf_layout = { 'down': '40%' }

    let g:loaded_gzip               = 1
    let g:loaded_tarPlugin          = 1
    let g:loaded_zipPlugin          = 1
    let g:loaded_2html_plugin       = 1
    let g:loaded_rrhelper           = 1
    let g:loaded_remote_plugins     = 1
    let g:loaded_netrw              = 1
    let g:loaded_netrwPlugin        = 1
    let g:loaded_netrwSettings      = 1   
    let g:loaded_getscript          = 1
    let g:loaded_getscriptPlugin    = 1
    let g:loaded_matchit            = 1
    let g:loaded_matchparen         = 1
    let g:loaded_logiPat            = 1
    let g:loaded_rrhelper           = 1
    let g:loaded_netrw              = 1
    let g:loaded_netrwPlugin        = 1
