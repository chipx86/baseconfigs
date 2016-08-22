" Old macros I used to use for working with ChangeLogs.
" There are here for historical reasons, mostly.
ab rdate <C-R>=strftime("%m/%d/%y")<CR>
ab edate <C-R>=strftime("%A, %B %d, %Y")<CR>
ab rtime <C-R>=strftime("%X")<CR>
ab rtimestamp <C-R>=strftime("%a %b %d %T %Z %Y")<CR>

ab clme Christian Hammond <chipx86@chipx86.com>
ab clhead <ESC>0C<C-R>=strftime("%a %b %d %T %Z %Y")<CR>  Christian Hammond <chipx86@chipx86.com>
ab clsep ---------------------------------------------------------------------

map ,cl <ESC>:0<CR>Oclhead<CR><CR><CR><ESC>ki<TAB>* 
map ,cf :s/^M *\(.*\)$/\t\* \1:/g<CR>jO<TAB>  - 
map ,csl <ESC>:0<CR>Oclhead<CR><CR><CR><ESC>k:.!/home/chipx86/bin/add-changelog-entry.sh<CR>/- <CR>A
"map ,csl <ESC>:0<CR>Oclhead<CR><CR><CR><ESC>k:.!(svn status \| sort \| grep -v '?' \| sed -e 's/^M *\(.*\)$/\t\* \1:/g' -e 's/^\([AD]\) *\(.*\)$/\t\1 \2:/g' && echo "\t  - ")<CR>/- <CR>A

map ,L  1G/Last updated:\s*/e+1<CR>Crtimestamp<ESC>
map ,,L 1G/Last changed:\s*/e+1<CR>Crtimestamp<ESC>

imap `CAP <ESC>mzB~`za

map <TAB>J Jwi<BS><CR><ESC>
" map ~J <TAB>J
