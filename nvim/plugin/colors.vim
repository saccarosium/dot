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
    hi! NonText guibg=NONE
endif
