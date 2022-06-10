" All the modification I apport to colorschemes without touching my config file

if colors_name == 'dracula'
    hi! Cursorline guibg=#2f3241
endif

if colors_name == 'gruvbox'
    hi! link Delimiter GruvboxFg1
    au! FileType sh hi! link TSVariable GruvboxFg1
endif

if colors_name == 'codedark'
    hi! Ignore guifg=#1e1e1e
    " hi! StatusLine guibg=#0072be
    " hi! markdownH1 guifg=#569CD6 gui=bold
    " hi! link markdownH2 markdownH1
    " hi! link markdownH3 markdownH1
    " hi! link markdownH4 markdownH1
    " hi! link markdownH5 markdownH1
    " hi! link markdownH6 markdownH1
    " hi! link dotoo_heading1 markdownH1
    " hi! link dotoo_heading2 dotoo_heading1
    " hi! link dotoo_heading3 dotoo_heading1
    " hi! link dotoo_heading4 dotoo_heading1
    " hi! link dotoo_heading5 dotoo_heading1
    " hi! link dotoo_heading6 dotoo_heading1
    " hi! link orgHeading1 markdownH1
    " hi! link orgHeading2 markdownH1
    " hi! link orgHeading3 markdownH1
    " hi! link orgHeading4 markdownH1
    " hi! link orgHeading5 markdownH1
    " hi! link orgHeading6 markdownH1
endif
