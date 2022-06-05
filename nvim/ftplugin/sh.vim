inoreabbrev __bash #!/usr/bin/env<space>bash<CR>
inoreabbrev __magenta \e[35m
inoreabbrev __cyan \e[36m
inoreabbrev __blue \e[34m
inoreabbrev __yellow \e[33m
inoreabbrev __red \e[31m
inoreabbrev __reset \e[0m

if executable('shfmt')
  let &l:formatprg='shfmt -i ' . &l:shiftwidth
endif
