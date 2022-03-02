" function! FzfFiles(fullscreen)                                            
"   function! s:FzfFileAccept(lines) abort                                  
"     " a:lines is a list with three elements (two if there were no matches):
"     "   <search-query>, <expect-key>|<empty> [, <selected-items...>]      
"     if len(a:lines) < 2                                                   
"       return                                                              
"     elseif len(a:lines) == 2 || !empty(a:lines[1]) |                      
"       execute 'edit ' . a:lines[0]                                        
"     else                                                                  
"       execute 'edit ' . split(a:lines[2], '#####')[0]                     
"     endif                                                                 
"   endfunction                                                                                                      
"   let l:spec = {                                                          
"         \'options': ['-d=#####', '--print-query', '--expect=ctrl-j'],     
"         \'sink*': funcref('s:FzfFileAccept')                              
"         \}                                                                
"   call fzf#vim#files(getcwd(), fzf#vim#with_preview(l:spec), a:fullscreen)
" endfunction

" let g:fzf_layout = {'down': '30%'} 
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit' }
"
" let g:nv_default_extension = '.md'
" let g:nv_search_paths = ['$NOTES']
