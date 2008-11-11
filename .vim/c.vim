"so $HOME/.vim/syntax/c.vim
"so $HOME/.vim/syntax/c.vim
"so $HOME/.vim/ftplugin/ctab.vim

map ;c mz^i/*<ESC>$a*/<ESC>z
map ;C mz^2x$Xxz
vmap ;c <ESC><i/*<ESC>>a*/<ESC>
vmap ;C <ESC><2x>h2x

" Comment header generators.
map ;t :s/^[ <Tab>]*//<ESC>O/<ESC>74a*<ESC>jI * <ESC>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>kA
vmap ;t <ESC>:'<,'>s/^/ * /<CR>'<O<C-U>/<ESC>74a*<ESC>'>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>'<j0WW

" These are like the comment header generators above, except they generate
" ones suitable for Doxygen groups.
map ;T :s/^[ <Tab>]*//<ESC>O/<ESC>74a*<ESC>A/<ESC>jI/** @name <ESC>o<HOME><ESC>C/<ESC>74a*<ESC>A/<ESC>kA  */<ESC>hhhi
"vmap ;T <ESC>:'<,'>s/^/ * /<CR>'<O<C-U>/<ESC>74a*<ESC>'>o<C-U><HOME><ESC>C <ESC>74a*<ESC>A/<ESC>'<j0WW

set cinkeys=0{,0},:,0#,!^F,o,O

set cindent
set cinoptions=(0,t0
set formatoptions=croq
set formatprg=indent

set tags=./tags,../tags,../../tags,../../../tags,../../../../tags
set tags+=../../../../../tags,../../../../../../tags

"syn region myFold start="{" end="}" transparent fold
"syn sync fromstart
"set foldmethod=syntax
"set foldtext=v:folddashes.substitute(getline(v:foldstart+1),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
