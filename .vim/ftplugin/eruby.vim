" Vim syntax file
" Language:     Ruby
" Maintainer:   Mirko Nasato
" Last Change:  2001 May 10
" Location:     http://altern.org/mn/ruby/ruby.vim

" See http://altern.org/mn/ruby/vim.html for documentation.
" Thanks to perl.vim authors, and to Reimer Behrends. :-)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'eruby'
endif

if version < 600
  so <sfile>:p:h/html.vim
  syn include @Ruby <sfile>:p:h/ruby.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
  syn include @Ruby syntax/ruby.vim
endif

syn cluster htmlPreproc add=erubyRegion

syn region erubyRegion keepend matchgroup=Delimiter start=+<%=\=+ skip=+".*%>.*"+ end=+%>+ contains=@Ruby

let b:current_syntax = "eruby"
