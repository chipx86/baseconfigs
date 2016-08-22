function CFoldText()
	let rawline1 = getline(v:foldstart)
	let rawline2 = getline(v:foldstart + 1)
	let line1 = substitute(rawline1, '/\*\|\*/\|{{{\d\=', '', 'g')
	let line2 = substitute(rawline2, '/\*\|\*/\|{{{\d\=', '', 'g')
	let last_char = strpart(line1, strlen(line1) - 1, 1)

	if strpart(rawline1, 0, 2) == '/*'
		" It's a comment.
		let line = substitute(line1 . line2, '\*\+', '', 'g')

		return v:folddashes . line
	endif

	if matchstr(line2, "{")
		return v:folddashes . line1
	else
		if last_char == "*" || last_char == "&"
			return v:folddashes . line1 . line2
		endif
			return v:folddashes . line1 . " " . line2
	endif
endfunction

function CFoldExpr()
	if getline(v:lnum + 3) =~ '{'
		return '>1'
	elseif getline(v:lnum) =~ '^}$'
		return '<1'
	else
		return '='
	endif
endfunction

"set foldmethod=expr
set foldmethod=marker
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\+\\\|\\*/\\\|{{{\\d\\=','','g')
"set foldtext=CFoldText()
"set foldexpr=CFoldExpr()

"au BufWinLeave *.c,*.h,*.cc,*.cpp,*.c++ mkview
"au BufWinEnter,BufEnter *.c,*.h,*.cc,*.cpp,*.c++ silent loadview

