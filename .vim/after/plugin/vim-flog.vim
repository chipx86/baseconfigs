let g:flog_default_arguments = {
			\ 'date': 'format:%Y-%m-%d',
			\ 'format': '%h -%d %s (%cr - %cd) <%an>',
			\ }

nnoremap <silent><leader>gl :Flog -all<CR>

augroup flog
	autocmd FileType floggraph nnoremap <buffer> <CR> :belowright Flogsplitcommit<CR>
augroup END
