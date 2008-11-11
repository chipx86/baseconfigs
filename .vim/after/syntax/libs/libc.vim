" Memory management
syn keyword libcFunction malloc
syn keyword libcFunction realloc
syn keyword libcFunction free

" Memory data functions
syn keyword libcFunction memcpy

" I/O
syn keyword libcFunction printf
syn keyword libcFunction fprintf

" String functions
syn keyword libcFunction strdup
syn keyword libcFunction strcpy
syn keyword libcFunction strncpy
syn keyword libcFunction sprintf
syn keyword libcFunction snprintf

" Default highlighting
if version >= 508 || !exists("did_libc_syntax_inits")
	if version < 508
		let did_libc_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink libcType		Type
	HiLink libcFunction	Function
	HiLink libcMacro		Macro
	HiLink libcConstant	Constant
	delcommand HiLink
endif
