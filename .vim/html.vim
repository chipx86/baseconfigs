"map ;c mz?<<CR>a!--<ESC>/><CR>i--<ESC>`z
"map ;C mz?<<CR>l3x/><CR>2X`z
"vmap ;c <ESC>`<i<!--<ESC>`>a--><ESC>
"vmap ;C <ESC>`<4x`>2h3x
"
"set formatoptions=tcql
"set comments=sr:<!--,mb:-,el:-->

"map ;s :!clear;htmlcheck %<CR>

"map ;h lBi<a href="<ESC>Ea"></a><ESC>3hi
"map ;H lBi<code><ESC>Ea</code><ESC>B
"vmap ;H <ESC>`<i<code><ESC>`>a</code><ESC>`<6l
"
"map ;t :s/^[ <TAB>]*//<CR>O<C-U><!--<ESC>jI<C-U>    <ESC>o<C-U>--><ESC>k0
"vmap ;t <ESC>:'<,'>s/^[ <TAB>]*//<CR>:'<,'>s/^/    /<CR>'<O<C-U><!--<ESC>'>o<C-U>  --><ESC>'<0W

iab Hdt <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"<CR> "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

iab Hht <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

map ;m :"<CR>
unmap ;m
map ;M :"<CR>
unmap ;M
map ;N :"<CR>
unmap ;N
