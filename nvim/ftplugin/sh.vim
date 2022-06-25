compiler! shellcheck

if executable('shfmt')
  let &l:formatprg='shfmt -i ' . &l:shiftwidth
endif
