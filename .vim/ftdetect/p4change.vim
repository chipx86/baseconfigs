au Syntax p4change so $HOME/.vim/syntax/p4change.vim

au BufNewFile,BufRead foo,tmp* if getline(1) == '' && getline(2) =~ "Change:\t" | setf p4change
