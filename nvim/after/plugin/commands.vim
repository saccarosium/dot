fun! commands#editFiletype()
    let s:type = &filetype
    let s:mode = 'vs'
    exe ':'.s:mode.' '.expand('$XDG_CONFIG_HOME/nvim/after/ftplugin/').s:type.'.vim'
endfun

command! Editfiletype :call commands#editFiletype()
