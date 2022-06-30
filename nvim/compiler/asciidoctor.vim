if exists("current_compiler")
  finish
endif
let current_compiler = "asciidoctor"

let s:cpo_save = &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=asciidoctor-pdf\ %
