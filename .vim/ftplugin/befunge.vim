" Vim syntax file
" Language:     Befunge '98
" Maintainer:   Christian Hammond
" Last Change:  12 May 2002
" Location:     http://www.chipx86.com/development/befunge/befunge.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'befunge'
endif

syn region befungeString start=+"+ end=+"+
"syn match  befungeNumber "\d"

syn match befungeDirection "\(<\|>\|\^\|v\|h\|l\|?\|\]\|\[\|r\|x\)"
syn match befungeFlowCtrl  "\(#\|@\|;\|j\|q\|k\)"
syn match befungeDecision  "\(!\|`\|_\||\|m\|w\)"
syn match befungeOperator  "\(+\|\*\|-\|/\|%\|::\)"
syn match befungeIO        "\('\|g\|p\|\.\|,\|&\|\~\|i\|o\|=\|y\)"
syn match befungeStack     "\($\|:\|\\\|n\|{\|}\|u\)"
syn keyword befungePush    0 1 2 3 4 5 6 7 8 9 a b c d e f

if version >= 508 || !exists("did_befunge_syntax_inits")
  if version < 508
    let did_befunge_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink befungeDirection Keyword
  HiLink befungeDecision  Keyword
  HiLink befungeFlowCtrl  Statement
  HiLink befungeIO        Function
  HiLink befungeStack     Function
  HiLink befungeOperator  Operator
  HiLink befungePush      Operator
  HiLink befungeString    String
"  HiLink befungeNumber    Number

  delcommand HiLink
endif

let b:current_syntax = "befunge"

" vim: ts=4
