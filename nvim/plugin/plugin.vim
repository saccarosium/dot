"######################### set settings ##############################

    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END
    let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim"]
    let g:pandoc#syntax#conceal#urls = 1

    let g:fzf_layout = { 'down': '40%' }

    let g:loaded_gzip               = 1
    let g:loaded_tarPlugin          = 1
    let g:loaded_zipPlugin          = 1
    let g:loaded_2html_plugin       = 1
    let g:loaded_rrhelper           = 1
    let g:loaded_remote_plugins     = 1
    let g:loaded_netrw              = 1
    let g:loaded_netrwPlugin        = 1
    let g:loaded_netrwSettings      = 1   
    let g:loaded_getscript          = 1
    let g:loaded_getscriptPlugin    = 1
    let g:loaded_matchit            = 1
    let g:loaded_matchparen         = 1
    let g:loaded_logiPat            = 1
    let g:loaded_rrhelper           = 1
    let g:loaded_netrw              = 1
    let g:loaded_netrwPlugin        = 1

