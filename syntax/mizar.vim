" Syntax highlighting for Mizar articles
" Author:   Andy Morris
" License:  Same as Vim

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "cabal"

if version < 600
  syntax clear
endif


setlocal fileformat=dos

syn keyword mizOuter environ begin
hi def link mizOuter Structure

syn keyword mizEnviron vocabularies notations constructors registrations
                     \ definitions theorems schemes requirements
                     \ equalities expansions
hi def link mizEnviron Typedef

syn keyword mizDecl reserve theorem definition notation scheme end
                  \ func pred means equals redefine proof
                  \ synonym antonym
                  \ provided
                  \ existence uniqueness coherence compatibility
                  \ consistency reducibility
                  \ symmetry asymmetry connectedness reflexivity irreflexivity
                  \ commutativity idempotence involutiveness projectivity
hi def link mizDecl Typedef

syn keyword mizLet let be such that and
hi def link mizLet Typedef

syn keyword mizProof per cases case suppose assume given take then
                   \ consider reconsider as
                   \ thus hence hereby now
hi def link mizProof Structure
syn keyword mizJust nextgroup=mizThmRef skipwhite skipnl by from
hi def link mizJust Structure

syn keyword mizThesis thesis
hi def link mizThesis Constant

syn keyword mizLogic or implies iff not for being ex st holds
syn match mizLogic /&/
hi def link mizLogic Function

syn keyword mizOp in is are
syn match mizOp /\.\?=\|<>\|<=\|>=\|\<do\(es\)\?\>\(\_s\+not\)\?/
syn match mizOp /+\|-\|\/\|\*\|c=/
hi def link mizOp Constant

syn match mizLabel /\w\+:\|:\w\+:/
hi def link mizLabel Special
syn match mizThmRef contained nextgroup=mizThmRefComma,mizThmRefArg
  \ skipwhite skipnl /\w\+\(\s*:\s*\(\(sch\|def\)\s*\)\?\d\+\)\?/
hi def link mizThmRef Special
syn match mizThmRefComma transparent nextgroup=mizThmRef skipwhite skipnl /,/
syn region mizThmRefArg matchgroup=mizDelim contains=mizDelim
  \ start='(' end=')'
hi def link mizThmRefArg mizThmRef

syn match mizComment /::.*$/ contains=vimTodo
hi def link mizComment Comment

syn match mizNumber /\<\d\+\>/
hi def link mizNumber Number

syn match mizPrivParam /\$\(\d\|10\)/
hi def link mizPrivParam Macro

syn match mizDelim /[\[\](){},;]\|->/
hi def link mizDelim Delimiter
