" All the modification I apport to colorschemes without touching my config file

if colors_name == 'dracula'
    hi! Cursorline ctermbg=black guibg=#2f3241
endif

if colors_name == 'gruvbox'
    hi! link Delimiter GruvboxFg1
    au! FileType sh hi! link TSVariable GruvboxFg1
endif
