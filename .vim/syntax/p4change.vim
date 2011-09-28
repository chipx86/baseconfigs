" Vim syntax file
" Language:	    Perforce Change Specification
" Maintainer:   Christian Hammond <christian@vmware.com>
" URL:          none
" Last Change:  27-September-2011


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
	let main_syntax = 'p4change'
endif

syn case match

syn region p4changeComment start=/#/ end=/$/
syn region p4changeValue start="." end="$" contained

syn region p4changeTopFields oneline contained
	\ start=/^\(Change\|Date\|Client\|User\|Status\):/
    \ end=/$/ contains=p4changeFieldName,p4changeValue

syn region p4changeFields
	\ start=/^Description:$/
    \ end=/^Files:$/me=s-1
	\ contains=p4changeLogImport,p4changeFieldName,p4changeSubField
syn region p4changeFields
	\ start=/^Files:$/
	\ end=/^$/
	\ contains=p4changeFieldName,p4changeFile,p4changeFileStatus

syn region p4changeSubField oneline
	\ start=/\t\(QA Notes\|Testing Done\|Documentation Notes\|
	        \Bug Number\|Approved by\|Reviewed by\|Review URL\|Mailto\):/
	\ end=/$/ contains=p4changeSubFieldName,p4changeValue

syn region p4changeFieldsFold start=/^# A Perforce Change Specification/ end=/\nDescription:$/me=s keepend transparent fold contains=p4changeComment,p4changeTopFields

syn match p4changeLogImport contained /\*\*\* git-changeset log import/
syn match p4changeFile contained /^\t\/\/[^#]\+/
syn match p4changeFileStatus contained /# \(edit\|delete\|add\|branch\)/
syn match p4changeNumber /[0-9]\+/
syn match p4changeFieldName contained /^[A-Z][^:]\+:/
syn match p4changeSubFieldName contained /\t[A-Z][^:]\+:/

hi def link p4changeValue String
hi def link p4changeComment Comment
hi def link p4changeFieldName Keyword
hi def link p4changeSubFieldName Keyword
hi def link p4changeFile Type
hi def link p4changeFileStatus Constant
hi def link p4changeNumber Number
hi def link p4changeLogImport TODO

setlocal foldmethod=syntax

let b:current_syntax = "p4change"
