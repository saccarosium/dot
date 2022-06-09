if executable('alejandra')
    setlocal formatprg=alejandra\ -q\ -c
    setlocal formatexpr=
endif

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
