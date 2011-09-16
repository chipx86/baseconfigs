"
" misc.vim
"
" Misc. functions that can be useful anywhere.
"

" These are good for ChangeLogs and other happy files.
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

" Deletes trailing whitespace.
map ,dt :%s/\s\+$//<CR>

map ,L  1G/Last updated:\s*/e+1<CR>Crtimestamp<ESC>
map ,,L 1G/Last changed:\s*/e+1<CR>Crtimestamp<ESC>

" Buffer stuff
"nmap <Esc>1 :b1<CR>
"nmap <Esc>2 :b2<CR>
"nmap <Esc>3 :b3<CR>
"nmap <Esc>4 :b4<CR>
"nmap <Esc>5 :b5<CR>
"nmap <Esc>6 :b6<CR>
"nmap <Esc>7 :b7<CR>
"nmap <Esc>8 :b8<CR>
"nmap <Esc>9 :b9<CR>
"nmap <Esc>0 :b10<CR>

imap `CAP <ESC>mzB~`za

map <TAB>J Jwi<BS><CR><ESC>
" map ~J <TAB>J

" Load some syntax files here
"au Syntax changelog so $HOME/.vim/changelog.vim
"au BufNewFile,BufRead ChangeLog,changelog		set ft=changelog

" Set the colors
colorscheme my-default


"
" Highlight whitespaces at the end of the line.
au BufNewFile,BufReadPost,WinEnter * highlight WhitespaceEOL ctermbg=red guibg=red
au BufNewFile,BufReadPost,WinEnter * match WhitespaceEOL /^ \+\|\s\+$/

" Check for extra spaces instead of tabs at the front of the line
"au BufNewFile,BufReadPost,WinEnter * match WhitespaceEOL /^\ \+/

" Highlight redundant whitespaces.
au BufNewFile,BufReadPost,WinEnter * highlight RedundantSpaces ctermbg=red guibg=red
au BufNewFile,BufReadPost,WinEnter * match RedundantSpaces /\s\+$\| \+\ze\t/


let g:Gitv_OpenHorizontal = 0
