let g:airline_powerline_fonts = 1
let g:airline_theme = "powerline"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'

" Put a red modified symbol in the status line, line vim-powerline had.
let g:airline_detect_modified = 0

function! Init()
	call airline#parts#define_raw('listedbufnum', '%{ListedBufNumber()}')
	call airline#parts#define_raw('modified', '%{&modified ? "[+]" : ""}')
	call airline#parts#define_accent('modified', 'red')
	let spc = g:airline_symbols.space
	let g:airline_section_a = airline#section#create_left(
		\ ['listedbufnum', 'mode', 'crypt', 'paste', 'capslock', 'iminsert'])
	let g:airline_section_c = airline#section#create(
		\ ['%<', '%f', spc, 'modified', spc, 'readonly'])
endfunction

autocmd VimEnter * call Init()
