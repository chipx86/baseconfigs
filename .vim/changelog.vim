" Vim syntax file
" Language:     ChangeLog files
" Maintainer:   Christian Hammond <chipx86@portaldesign.net>
" Last change:  Tuesday, October 05, 1999

" clear any unwanted syntax defs
syn clear


" shut case off
syn case ignore

syn match changelogItem   "^\s*[\*AR]"
"syn match changelogSection "\(\([\./ ,A-Za-z0-9_-]\|[^:]\)\+\):"
syn match changelogSection "\([\./A-Za-z0-9_-]\+\.[A-Za-z0-9]\+,*\s*\)\+:"
syn match changelogDate   "\(Sun\|Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\)\s*\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\)\s*\d*"
syn match changelogTime   "\(\d\d:\d\d:\d\d ... \d\d\d\d\|, \d\d\d\d\)"
syn match changelogEmail  "<.\+@.\+>"
"syn match changelogSection "^[./A-Za-z0-9_-]\+:"
"syn match changelogSection "[\./A-Za-z0-9_-]\+\..\+:"

"syn match changelogSection "\([\./A-Za-z0-9_-]\+\(\s*,\s*\)\)\+:"
syn match changelogSep     "^---\+"

if !exists("did_changelog_syntax_inits")
	let did_changelog_syntax_inits = 1
	" The default methods for highlighting.  Can be overridden later
	hi link changelogDate    Number 
	hi link changelogTime    Number
	hi link changelogEmail   Special 
	hi link changelogItem    Statement 
	hi link changelogSection Type
	hi link changelogSep     Delimiter 
endif

let b:current_syntax = "changelog"

" vim:ts=8
