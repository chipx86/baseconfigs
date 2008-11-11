" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Christian Hammond <chipx86@gnupdate.org>
" Last Change:	2004 March 05

hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "my-default"

if &background == "dark"
  hi Comment	term=bold ctermfg=Cyan guifg=#80a0ff
  hi Constant	term=underline ctermfg=Magenta guifg=#ffa0a0
  hi Special	term=bold ctermfg=LightRed guifg=Orange
  hi Identifier term=underline cterm=bold ctermfg=Cyan guifg=#40ffff
  hi Statement	term=bold ctermfg=Yellow guifg=#ffff60 gui=bold
  hi PreProc	term=underline ctermfg=Yellow guifg=#ff80ff
  hi Type		term=underline ctermfg=LightGreen guifg=#60ff60 gui=bold
  hi Ignore		ctermfg=black guifg=bg
else
  hi Comment	term=bold ctermfg=DarkBlue guifg=Blue
  hi Constant	term=underline ctermfg=DarkRed guifg=Magenta
  hi Special	term=bold ctermfg=DarkMagenta guifg=SlateBlue
  hi Identifier term=underline ctermfg=DarkCyan guifg=DarkCyan
  hi Statement	term=bold ctermfg=Brown gui=bold guifg=Brown
  hi PreProc	term=underline ctermfg=DarkMagenta guifg=Purple
  hi Type		term=underline ctermfg=DarkGreen guifg=SeaGreen gui=bold
  hi Ignore		ctermfg=white guifg=bg
endif

