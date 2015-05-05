" Syntax highlighting for Mizar vocabularies
" Author:   Andy Morris
" License:  Same as Vim

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "mizar_voc"

if version < 600
  syntax clear
endif


setlocal fileformat=dos

syn match mizVocFirst '^.' contained
hi def link mizVocFirst Comment

fun! s:voc_type(name, letter, highlight)
  exe 'syn match mizVoc'.a:name.' /^'.a:letter.'\S*/ contains=mizVocFirst'
  exe 'hi def link mizVoc'.a:name.' '.a:highlight
endf

for [l, n, hl] in [ ['R', 'Pred',   'Constant'],
                  \ ['O', 'Func',   'Function'],
                  \ ['M', 'Mode',   'Typedef'],
                  \ ['G', 'Struct', 'Structure'],
                  \ ['U', 'Select', 'Identifier'],
                  \ ['V', 'Attr',   'Special'],
                  \ ['K', 'LBra',   'Delimiter'],
                  \ ['L', 'RBra',   'Delimiter']]
  call s:voc_type(n, l, hl)
endfor

syn match mizVocPrio /\d\+/
hi def link mizVocPrio Number
