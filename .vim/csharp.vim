map ;t :s/^[ <Tab>]*//<ESC>O/<ESC>74a*<ESC>jI * <ESC>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>kA
vmap ;t <ESC>:'<,'>s/^/ * /<CR>'<O<C-U>/<ESC>74a*<ESC>'>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>'<j0WW
map ;T :s/^[ <Tab>]*//<ESC>O/<ESC>74a*<ESC>A/<ESC>jI/** @name <ESC>o<HOME><ESC>C/<ESC>74a*<ESC>A/<ESC>kA  */<ESC>hhhi

set cindent
set cinkeys=0{,0},:,0#,!^F,o,O
set cinoptions=(0,t0
set formatoptions=croq
set formatprg=indent
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags
set tags+=../../../../../tags,../../../../../../tags

" Folding
function! CSharpFoldText(add)
	let line = getline(v:foldstart + a:add)
	let sub = substitute(line, '#region\s', '', 'i')
	let ts = &tabstop
	let text = ""
	while (l:ts > 0)
		let text = text . v:folddashes[0]
		let ts = ts - 1
	endwhile
	return substitute(sub, "\t", text, "g")
endfunction

syn region csharpRegionFold start="#region" end="#endregion" transparent fold keepend
syn sync fromstart
set foldmethod=syntax foldtext=CSharpFoldText(0)
