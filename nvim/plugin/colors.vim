" All the modification I apport to colorschemes without touching my config file

if colors_name == 'dracula'
    hi! Cursorline guibg=#2f3241
endif

if colors_name == 'gruvbox'
    hi! link Delimiter GruvboxFg1
    au! FileType sh hi! link TSVariable GruvboxFg1
endif

if colors_name == 'codedark'
    hi! TSType guifg=#569CD6
    hi! markdownH1 guifg=#569CD6 gui=bold
    hi! link markdownH2 markdownH1
    hi! link markdownH3 markdownH1
    hi! link markdownH4 markdownH1
    hi! link markdownH5 markdownH1
    hi! link markdownH6 markdownH1
    hi! link markdownH1Delimiter markdownH1
    hi! link markdownH2Delimiter markdownH1
    hi! link markdownH3Delimiter markdownH1
    hi! link markdownH4Delimiter markdownH1
    hi! link markdownH5Delimiter markdownH1
    hi! link markdownH6Delimiter markdownH1
    hi! NonText guibg=NONE
endif
