fun! s:move(target, destination) abort
    return 'mv ' . shellescape(a:target) . ' ' . shellescape(a:destination)
endfun

fun! s:delete(target) abort
    return 'trash ' . shellescape(a:target)
endfun

fun! CreateFile() abort
  " Prompt for new filename
  let filename = input('File name: ')
  if trim(filename) == ''
    return
  endif
  " Append filename to the path of the current buffer
  let filepath = expand("%") . filename

  let output = system("touch " . shellescape(filepath))
  if v:shell_error
    call s:logError(cmd)
  endif

  " Reload the buffer
  Dirvish %
endf

fun! CreateDirectory() abort
  let dirname = input('Directory name: ')
  if trim(dirname) == ''
    return
  endif
  let dirpath = expand("%") . dirname
  if isdirectory(dirpath)
    redraw
    echomsg printf('"%s" already exists.', dirpath)
    return
  endif

  let output = system("mkdir " . shellescape(dirpath))
  if v:shell_error
    call s:logError(output)
  endif

  " Reload the buffer
  Dirvish %
endf

fun! DeleteItemUnderCursor() abort
  " Grab the line under the cursor. Each line is a filepath
  let target = trim(getline('.'))
  " Feed the filepath to a delete command like, rm or trash
  let check = confirm("Delete ".target, "&Yes\n&No", 2)
  if check != 1
    echo 'Cancelled.'
    return
  endif
  let output = system(s:delete(target))
  if v:shell_error
    call s:logError(output)
  endif

  " Reload the buffer
  Dirvish %
endfun

fun! RenameItemUnderCursor() abort
  let target = trim(getline('.'))
  let filename = fnamemodify(target, ':t')
  let newname = input('Rename: ', filename)
  if empty(newname) || newname ==# filename
    return
  endif
  let cmd = s:move(target, expand("%") . newname)
  let output = system(cmd)
  if v:shell_error
    call s:logError(output)
  endif

  " Reload the buffer
  Dirvish %
endfun

setlocal nonumber
setlocal norelativenumber

nmap <buffer> h -^
nmap <buffer> l <CR>
nnoremap <buffer> D :silent! call DeleteItemUnderCursor()<CR>
nnoremap <buffer> <leader>r :silent! call RenameItemUnderCursor()<CR>
nnoremap <buffer> <leader>f :silent! call CreateFile()<CR>
nnoremap <buffer> <leader>d :silent! call CreateDirectory()<CR>
