" Vim syntax file
" Language:	    Gaim FAQ
" Maintainer:   Christian Hammond <chipx86@gnupdate.org>
" URL:          none
" Last Change:  13-July-2003


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
	let main_syntax = 'gaimfaq'
endif

if !exists("gaimfaq_no_html")
	so $VIMRUNTIME/syntax/html.vim
	syn cluster htmlPreproc add=gaimfaqCommand,gaimfaqQuestion,gaimfaqAnswer
endif

syn case match

syn region gaimfaqCommand  keepend start="^!\(SECTION\|ANCHOR\|COMMENT\)\t" end="$"
syn region gaimfaqQuestion keepend start="^Q:" end="\t"
syn region gaimfaqAnswer   keepend start="^A:" end="\t"


if !exists("did_gaimfaq_syntax_inits")
	let did_gaimfaq_syntax_inits = 1

	hi link gaimfaqCommand  Function
	hi link gaimfaqQuestion Label
	hi link gaimfaqAnswer   Label
endif

let b:current_syntax = "gaimfaq"

