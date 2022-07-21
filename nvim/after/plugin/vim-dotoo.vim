let g:dotoo#parser#todo_keywords = [
  \ 'TODO',
  \ 'WAIT',
  \ '|',
  \ 'DONE']

let g:dotoo#agenda#files = ['~/Projects/*.org', '~/Projects/*/*.org']
let g:dotoo#capture#refile = expand('~/Projects/todo.org')
let g:dotoo#capture#templates = {
      \ 't': {
      \   'description': 'Todo',
      \   'lines': [
      \     '* TODO %?'
      \   ],
      \ },
      \}
