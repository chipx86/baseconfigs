"so $HOME/.vim/syntax/c.vim
"so $HOME/.vim/syntax/c.vim
"so $HOME/.vim/ftplugin/ctab.vim

map <buffer> ;c mz^i/*<ESC>$a*/<ESC>z
map <buffer> ;C mz^2x$Xxz
vmap <buffer> ;c <ESC><i/*<ESC>>a*/<ESC>
vmap <buffer> ;C <ESC><2x>h2x

" Comment header generators.
map <buffer> ;t :s/^[ <Tab>]*//<ESC>O/<ESC>74a*<ESC>jI * <ESC>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>kA
vmap <buffer> ;t <ESC>:'<,'>s/^/ * /<CR>'<O<C-U>/<ESC>74a*<ESC>'>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>'<j0WW

" These are like the comment header generators above, except they generate
" ones suitable for Doxygen groups.
map <buffer> ;T :s/^[ <Tab>]*//<ESC>O/<ESC>74a*<ESC>A/<ESC>jI/** @name <ESC>o<HOME><ESC>C/<ESC>74a*<ESC>A/<ESC>kA  */<ESC>hhhi
"vmap <buffer> ;T <ESC>:'<,'>s/^/ * /<CR>'<O<C-U>/<ESC>74a*<ESC>'>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>'<j0WW

setlocal cinkeys=0{,0},:,0#,!^F,o,O

setlocal cindent
setlocal cinoptions=(0,t0
setlocal formatoptions=croq
setlocal formatprg=indent

setlocal tags=./tags,../tags,../../tags,../../../tags,../../../../tags
setlocal tags+=../../../../../tags,../../../../../../tags

"syn region myFold start="{" end="}" transparent fold
"syn sync fromstart
"setlocal foldmethod=syntax
"setlocal foldtext=v:folddashes.substitute(getline(v:foldstart+1),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
