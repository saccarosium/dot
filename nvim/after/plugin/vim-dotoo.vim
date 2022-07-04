let g:dotoo#parser#todo_keywords = [
  \ 'TODO',
  \ 'WAIT',
  \ '|',
  \ 'DONE']

let g:dotoo#agenda#files = ['~/Documents/nextcloud/Projects/*.org', '~/Documents/nextcloud/Projects/*/*.org']
let g:dotoo#capture#refile = expand('~/Documents/nextcloud/Projects/todo.org')
let g:dotoo#capture#templates = {
      \ 't': {
      \   'description': 'Todo',
      \   'lines': [
      \     '* TODO %?'
      \   ],
      \ },
      \}
