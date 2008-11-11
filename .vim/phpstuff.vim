"
" phpstuff.vim
"
" Simple macros and abbreviations for PHP
"
augroup php3

" First, set the DarkReds for the PHP3 syntax highlighting
" to a better color...
hi php3IntVar guifg=Red ctermfg=Red
hi php3EnvVar guifg=Red ctermfg=Red

" Outputs a standard comment header
"map ,cs k:r ~/.vim/phpstuff/commenthead.template<CR>

" Outputs a function header
"map ,cf k:r ~/.vim/phpstuff/funchead.template<CR>

augroup END
