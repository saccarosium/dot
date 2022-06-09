if eval(tablemode#IsActive()) == 0
    TableModeEnable
endif

fun! text#HeadererLine(char)
    put =repeat(a:char, &textwidth)
    normal kdd
endfun

fun! text#Headerer(char)
    exe 'normal'.'^yypVr'.a:char
endfun

nnoremap <localleader>hh :call text#HeadererLine(nr2char(strgetchar(getline('.')[col('.') - 1:], 0)))<CR>
nnoremap <localleader>h1 :call text#Headerer('=')<CR>
nnoremap <localleader>h2 :call text#Headerer('-')<CR>
nnoremap <localleader>h3 :call text#Headerer('~')<CR>
