if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "me"
set background=dark

let s:back_gui = "#14171F"
let s:back_soft_gui = "#14171F"
let s:back_softer_gui = "#14171F"
let s:warning = "#E3C84F"
let s:error = "#B44B4B"
let s:contrast = "#39C689"
let s:normal = "#6F8EC3"
let s:for_gui = "#F2F2F2"
let s:comment = "#666666"
let s:magenta = "#C76B99"
let s:cyan = "#76D5D5"
let s:blue = "#39C689"
let s:selection = "#93AAD2"

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", "", "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction


" --------- "
"    UI     "
" --------- "
 
" - Editor -
"
call s:hi("ColorColumn", "", "", "NONE", "", "", "")
call s:hi("Cursor", "", "", "", "NONE", "", "")
call s:hi("CursorLine", "", "", "NONE", "", "NONE", "")
call s:hi("Error", "s:warning", "", "", "", "", "")
call s:hi("iCursor", "", "", "", "NONE", "", "")
call s:hi("LineNr", s:comment, "NONE", "", "NONE", "", "")
call s:hi("MatchParen", "", "", "", "", "", "")
call s:hi("NonText", "", "", "", "", "", "")
call s:hi("Normal", s:for_gui, s:back_gui, "NONE", "NONE", "", "")
call s:hi("SignColumn", "", s:back_gui, "", "NONE", "", "")
call s:hi("CursorLineNr", s:for_gui, "", "NONE", "", "bold", "")
" call s:hi("IncSearch", s:nord6_gui, s:nord10_gui, s:nord6_term, s:nord10_term, s:underline, "")
call s:hi("Search", s:for_gui, s:selection, "", "", "NONE", "")
