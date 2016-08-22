if !has("gui_running")
  set background=dark
else
  set background=light
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  " set hlsearch
endif


" Set the colors
colorscheme desert256

" Set the line numbers to be dark gray
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


" Highlight whitespaces at the end of the line.
au BufNewFile,BufReadPost,WinEnter * highlight WhitespaceEOL ctermbg=red guibg=red
au BufNewFile,BufReadPost,WinEnter * match WhitespaceEOL /^ \+\|\s\+$/


" Check for extra spaces instead of tabs at the front of the line
"au BufNewFile,BufReadPost,WinEnter * match WhitespaceEOL /^\ \+/


" Highlight redundant whitespaces.
au BufNewFile,BufReadPost,WinEnter * highlight RedundantSpaces ctermbg=red guibg=red
au BufNewFile,BufReadPost,WinEnter * match RedundantSpaces /\s\+$\| \+\ze\t/


" Configure a gutter column showing the width at the end.
set colorcolumn=+1,+2,+3
highlight ColorColumn ctermbg=233 guibg=#080808
