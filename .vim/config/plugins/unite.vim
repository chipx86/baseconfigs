"let g:unite_enable_start_insert = 1
"let g:unite_enable_short_source_names = 1
"let g:unite_source_history_yank_enable = 1
"let g:unite_winwidth = 40
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
""nnoremap <leader>f :<C-u>Unite -buffer-name=files file<CR>
""nnoremap <leader>r :<C-u>Unite -buffer-name=files file_rec/async:!<CR>
"nnoremap <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>
"nnoremap <leader>[ :<C-u>Unite -buffer-name=buffer -quick-match buffer<CR>
"nnoremap <leader>y :Unite -buffer-name=yank history/yank<CR>
"nnoremap <space>/ :Unite grep:.<CR>
"
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()
"	imap <buffer> \ <Plug>(unite_exit)
"	map <buffer> \ <Plug>(unite_exit)
"	imap <silent><buffer><expr> <C-]> unite#do_action('split')
"endfunction
