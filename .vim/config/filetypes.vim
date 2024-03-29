filetype plugin indent on

let python_highlight_all=1

au Syntax php so $HOME/.vim/syntax/php.vim
au Syntax php3 so $HOME/.vim/syntax/php.vim
au Syntax eruby so $HOME/.vim/ftplugin/eruby.vim
au Syntax befunge so $HOME/.vim/ftplugin/befunge.vim

au BufNewFile,BufRead *.xsd,*.rdf,*.rss,*.ihtml setf xml
au BufNewFile,BufRead udiprops.txt              setf config
au BufNewFile,BufRead *.S,*.s,*.ASM             call <SID>FTasm()
au BufNewFile,BufRead *.cgi  if getline(1) =~ "#!.*perl"| setf perl | endif
au BufNewFile,BufRead *.rcp                     setf config
"au BufNewFile,BufRead *.c,*.cpp,*.h,*.hh,*.hpp,*.cxx,*.cc  source $HOME/.vim/c.vim
au BufNewFile,BufRead svn-commit.* setf svn | set noai et

"au FileType c,cpp  set si    sw=4 ts=4 | source $HOME/.vim/c.vim
au FileType cs     set si    sw=4 ts=4
"au FileType cpp    set si    sw=4 ts=4 | source $HOME/.vim/c.vim
au FileType dtd    set ai et sw=2 ts=2
au FileType html   set ai et sw=1 ts=1 formatoptions+=l
au FileType javascript set et si sw=4 ts=4 tw=80 formatoptions+=l
au FileType lisp   set    et           lisp
au FileType mail   set                 tw=70
au FileType perl   set ai    sw=4 ts=4
au FileType php    set ai    sw=4 ts=4 | let php_minlines=1000 | syntax sync lines=500
au FileType xml    set ai et sw=1 ts=1
au FileType python set ai et sw=4 ts=4 tw=79 smartindent sta sts=4 cinwords=if,elif,else,for,while,try,except,finally,def,class omnifunc=pythoncomplete#Complete formatoptions+=l
au FileType ruby    set ai et sw=4 ts=4
au FileType less    set et sw=2 ts=2
au FileType rst     set et sw=3 ts=3 tw=78
au FileType sh      set et sw=4 ts=4 tw=79

au BufNewFile,BufRead *.dbk let b:docbk_type="xml" | set ft=docbk
au BufNewFile,BufRead *.ml,*.rbx set ft=eruby
au BufNewFile,BufRead *.bf set ft=befunge

autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit | call setpos('.', [0, 1, 1])

"au BufNewFile,BufRead *.rbx,*.ml source $HOME/.vim/ftplugin/eruby.vim | set ft=eruby


" Automatically chmod +x Shell and Perl scripts
" autocmd BufWritePost   *.sh             !chmod +x %
" autocmd BufWritePost   *.pl             !chmod +x %

