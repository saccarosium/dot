"GENERAL SETTINGS
    set path+=** 
    set rtp+=/usr/local/opt/fzf
    set nobackup nowritebackup noswapfile autowriteall 
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
    set tabstop=8 
    set conceallevel=2
    set wildmenu wildignorecase 
    set number relativenumber
    set clipboard+=unnamed "set the vim's clipboard to the system's clipboard
    set viminfo+=n'$XDG_DATA_HOME/vim/viminfo'
    set encoding=UTF-8 

"KEYBINDINGS
    let mapleader=" "
    nnoremap Y y$
    nnoremap <leader>al Vgq
    nnoremap <leader>ff :FZF<CR>
    vmap < <gv
    vmap > >gv

"COLORS
    set termguicolors t_Co=256
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"FILETYPE
    filetype plugin on

    let g:fzf_layout = { 'down': '40%' }

    let g:loaded_gzip               =  1
    let g:loaded_tarPlugin          =  1
    let g:loaded_zipPlugin          =  1
    let g:loaded_2html_plugin       =  1
    let g:loaded_rrhelper           =  1
    let g:loaded_remote_plugins     =  1
    let g:loaded_netrw              =  1
    let g:loaded_netrwPlugin        =  1

