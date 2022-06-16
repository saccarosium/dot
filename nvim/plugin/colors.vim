" All the modification I apport to colorschemes without touching my config file

if ! exists("g:colors_name")
    let g:colors_name='default'
endif

if g:colors_name == 'dracula'
    hi! Cursorline guibg=#2f3241
endif

if g:colors_name == 'gruvbox'
    hi! link Delimiter GruvboxFg1
    au! FileType sh hi! link TSVariable GruvboxFg1
endif

if g:colors_name == 'codedark'
    hi! Ignore guifg=#1e1e1e
    " hi! StatusLine guibg=#0072be
    " hi! markdownH1 guifg=#569CD6 gui=bold
    " hi! link markdownH2 markdownH1
    " hi! link markdownH3 markdownH1
    " hi! link markdownH4 markdownH1
    " hi! link markdownH5 markdownH1
    " hi! link markdownH6 markdownH1
endif

if g:colors_name == 'default'
    hi! SignColumn ctermbg=NONE guibg=NONE
endif
