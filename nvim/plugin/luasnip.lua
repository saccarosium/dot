local ls = require "luasnip"

ls.snippets = {
  all = {
    ls.parser.parse_snippet("es", "## Esercizio $1\n\n## Consegna\n\n$0\n## Difficoltà\n\n## Possibili soluzioni\n"),
  },
  cpp = {
    ls.parser.parse_snippet("main", "#include <iostream>\n#include<vector>\n\nint main() {\n  $0\n  return 0;\n}"),
    ls.parser.parse_snippet("cout", "std::cout << $0 << std::endl;"),
  },
}
  
vim.cmd [[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>' 
" -1 for jumping backwards.
inoremap <silent> <C-k> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
smap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
]]
