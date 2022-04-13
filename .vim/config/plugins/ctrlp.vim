" Open selected items in the current window, rather than switching to an
" existing window where it's already opened.
let g:ctrlp_switch_buffer = 0

let g:ctrlp_custom_ignore = {
    \ 'dir': 'build\|dist\|htdocs/static\|docs_src\|docs_build\|node_modules\|.git',
\ }

nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPBuffer<CR>
