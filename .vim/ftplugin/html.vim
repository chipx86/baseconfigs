iab <buffer> Hdt <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"<CR> "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

iab <buffer> Hht <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

map <buffer> ;m :"<CR>
unmap <buffer> ;m
map <buffer> ;M :"<CR>
unmap <buffer> ;M
map <buffer> ;N :"<CR>
unmap <buffer> ;N


"---------------------------------------------------------------------------
" Django template mappings
"---------------------------------------------------------------------------

" Creates a blocktrans paragraph before the current line, looking like:
"
"     <p>
"     {%  blocktrans %}
map <buffer> ;sbtp O<p><CR><ESC>0i{%  blocktrans %}<ESC>

"
" Creates an ending blocktrans paragraph after the current line, looking like:
"
"     {%  endblocktrans %}
"     </p>
map <buffer> ;ebtp o<BS></p><ESC>O<ESC>0i{%  endblocktrans %}<ESC>

"
" Creates a blocktrans paragraph around the current paragraph, looking like:
"
"     <p>
"     {%  blocktrans %}
"     -- Content here --
"     {%  endblocktrans %}
"     </p>
"
" Note that this will also wrap the paragraph content, so be sure there's a
" blank line after.
map <buffer> ;btp ;sbtpj0wi<SPACE><ESC>Q}k;ebtpjjdd
