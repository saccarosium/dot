compiler! shellcheck

if executable('shfmt')
    setlocal formatprg=shfmt\ -s\ -i\ 4
    setlocal formatexpr=
endif
